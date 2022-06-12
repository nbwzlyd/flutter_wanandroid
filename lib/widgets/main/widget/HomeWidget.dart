import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/widgets/main/bean/BannerBean.dart';
import 'package:flutter_app/widgets/main/bean/ContentEntity.dart';
import 'package:flutter_app/widgets/main/repository/main_repository.dart';
import 'package:flutter_app/widgets/main/widget/HomeBannerWidget.dart';
import 'package:flutter_app/widgets/main/widget/contentWidget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<StatefulWidget> {
  BannerBean bannerBean;
  ContentEntity contentEntity;
  int page = 0;
  AsyncSnapshot<ContentEntity> _snapshot;

  StreamController<ContentEntity> _streamController = new StreamController();

  @override
  void initState() {
    super.initState();
    _getBannerData();
    _getItemData(page, false);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget list = EasyRefresh(
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          if (index == 0) {
            return HomeBannerWidget(bannerBean);
          }
          return ContentWidget(_snapshot.data, index - 1);
        },
        shrinkWrap: true,
        itemCount: _getItemCount(),
      ),
    );
    child:
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              "首页",
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              Container(
                width: 50,
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Icon(Icons.search),
                  onTap: () {},
                ),
                margin: EdgeInsets.only(right: 16),
              )
            ],
          ),
          preferredSize: Size.fromHeight(47),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _streamController.stream,
            builder: (BuildContext ctx, AsyncSnapshot<ContentEntity> snapshot) {
              _snapshot = snapshot;
              if (snapshot.connectionState == ConnectionState.active) {
                return list;
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                Toast.show("没有更多数据了~", context);
                return list;
              }
            },
          ),
        ));
  }

  int _getItemCount() {
    if (contentEntity == null || contentEntity.data == null) {
      return _getHeaderCount();
    } else {
      return contentEntity.data.datas.length + _getHeaderCount();
    }
  }

  int _getHeaderCount() {
    if (bannerBean != null && bannerBean.data != null) {
      if (bannerBean.data.isNotEmpty) {
        return 1;
      }
    }
    return 0;
  }

  void _getBannerData() {
    BannerRepository().getBanner().then((bannerBean) {
      setState(() {
        this.bannerBean = bannerBean;
      });
    });
  }

  void _getItemData(int index, bool load) {
    MainRepository().getContent(index).then((contentEntity) {
      if (!mounted) {
        return;
      }
      setState(() {
        if (load) {
          this.contentEntity.data.datas.addAll(contentEntity.data.datas);
        } else {
          if (index == 0) {
            this.contentEntity = contentEntity;
          } else {
            this
                .contentEntity
                .data
                .datas
                .insertAll(0, contentEntity.data.datas);
          }
        }
        _streamController.sink.add(this.contentEntity);
      });
    });
  }

  Future<Null> _onRefresh() async {
    _getItemData(++page, false);
  }

  Future _onLoad() async {
    _getItemData(++page, true);
  }
}

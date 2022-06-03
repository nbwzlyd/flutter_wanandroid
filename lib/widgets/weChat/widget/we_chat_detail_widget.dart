import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:toast/toast.dart';

import '../../main/bean/ContentEntity.dart';
import '../../main/widget/contentWidget.dart';
import '../respository/api_request.dart';

class WeChatDetailWidget extends StatefulWidget {
  final int id;

  const WeChatDetailWidget(this.id);

  @override
  State<StatefulWidget> createState() {
    return WeChatDetailState();
  }
}

class WeChatDetailState extends State<WeChatDetailWidget>
    with AutomaticKeepAliveClientMixin {
  ContentEntity contentEntity;
  int page = 1;
  AsyncSnapshot<ContentEntity> _snapshot;

  StreamController<ContentEntity> _streamController = new StreamController();

  @override
  void initState() {
    super.initState();
    getDetailData(widget.id, page);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget list = EasyRefresh(
      onLoad: _onLoad,
      topBouncing: false,
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return ContentWidget(_snapshot.data, index);
        },
        shrinkWrap: true,
        itemCount: _getItemCount(),
      ),
    );

    return Center(
      child: StreamBuilder(//构建一个任务流
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
    );
  }

  Future _onLoad() async {
    getDetailData(widget.id, ++page);
  }

  int _getItemCount() {
    if (contentEntity == null || contentEntity.data == null) {
      return 0;
    }
    return contentEntity.data.datas.length ?? 0;
  }

  void getDetailData(int id, int page) {
    WechatDetailRepository().getWxArticleList(id, page).then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        if (page == 1) {
          contentEntity = value;
        } else {
          if (page > contentEntity.data.pageCount) {
            //？？？

          }
          contentEntity.data.datas.addAll(value.data.datas);
        }
        _streamController.sink.add(this.contentEntity);
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}

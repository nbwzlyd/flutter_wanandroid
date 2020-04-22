import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/widgets/main/bean/BannerBean.dart';
import 'package:flutter_app/widgets/main/bean/ContentEntity.dart';
import 'package:flutter_app/widgets/main/repository/main_repository.dart';
import 'package:flutter_app/widgets/main/widget/HomeBannerWidget.dart';
import 'package:flutter_app/widgets/main/widget/contentWidget.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}
class HomeState extends State<StatefulWidget> {
  BannerBean bannerBean;
  ContentEntity contentEntity;
  int page=0;

  @override
  void initState() {
    super.initState();
    _getBannerData();
    _getItemData(page);
  }

  @override
  Widget build(BuildContext context) {
    child:
    return new RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          if (index == 0) {
            return HomeBannerWidget(bannerBean);
          }
          return ContentWidget(contentEntity, index - 1);
        },
        shrinkWrap: true,
        itemCount: _getItemCount(),
      ),
    );
  }

  int _getItemCount() {
    if (contentEntity == null || contentEntity.data == null) {
      return _getHeaderCount();
    } else {
      return contentEntity.data.datas.length + _getHeaderCount();
    }
  }



  int _getHeaderCount() {
    if (bannerBean!=null && bannerBean.data != null) {
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

  void _getItemData(int index) {
    MainRepository().getContent(index).then((contentEntity) {
      setState(() {
        this.contentEntity = contentEntity;
      });
    });
  }

  Future<Null> _onRefresh() async {
    _getItemData(page++);
  }
}

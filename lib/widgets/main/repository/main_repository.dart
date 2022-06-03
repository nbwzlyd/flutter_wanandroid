import 'dart:convert';

import 'package:flutter_app/widgets/api/WanAndroidApi.dart';
import 'package:flutter_app/widgets/api/util/dio_util.dart';
import 'package:flutter_app/widgets/main/bean/BannerBean.dart';
import 'package:flutter_app/widgets/main/bean/ContentEntity.dart';

class BannerRepository {
  /// 获取banner
  Future<BannerBean> getBanner() async {
    BannerBean bannerBean;
    await DioUtils.get<Map<String, dynamic>>(WanAndroidApi.BANNER)
        .then((result) {
      bannerBean = BannerBean.fromJson(jsonDecode(result));
    }).catchError((error) {
      bannerBean = new BannerBean();
    });
    return bannerBean;
  }
}

///获取首页的列表内容
class MainRepository {
  Future<ContentEntity> getContent(int page) async {
    ContentEntity contentEntity;
    await DioUtils.get<Map<String, dynamic>>(
            WanAndroidApi.getPath(page: page, path: WanAndroidApi.ARTICLE_LIST))
        .then((result) {
      contentEntity = ContentEntity.fromJson(jsonDecode(result));
    });

    return contentEntity;
  }
}

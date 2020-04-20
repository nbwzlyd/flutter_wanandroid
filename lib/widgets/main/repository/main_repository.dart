import 'dart:convert';

import 'package:flutter_app/widgets/api/WanAndroidApi.dart';
import 'package:flutter_app/widgets/api/util/dio_util.dart';
import 'package:flutter_app/widgets/main/bean/BannerBean.dart';

class BannerRepository{

  Future<BannerBean> getBanner() async {
    BannerBean bannerBean;
    await DioUtils.request<Map<String, dynamic>>(
        WanAndroidApi.BANNER, method: DioUtils.GET).then((result) {
          print("BannerRepository===>$result");
      bannerBean = BannerBean.fromJson(jsonDecode(result));
    }).catchError((error) {
      bannerBean = new BannerBean();
    });
    return bannerBean;
  }
}
import 'dart:convert';

import 'package:flutter_app/widgets/main/bean/ContentEntity.dart';

import '../../api/WanAndroidApi.dart';
import '../../api/util/dio_util.dart';
import '../bean/official_account_bean.dart';

///获取公众号成员
class WeChatTitleRepository {
  Future<OfficialAccountBean> getWxArticleMemberList() async {
    OfficialAccountBean officialAccountBean;
    await DioUtils.get<Map<String, dynamic>>(
            WanAndroidApi.getPath(path: WanAndroidApi.WXARTICLE_CHAPTERS))
        .then((result) {
      officialAccountBean = OfficialAccountBean.fromJson(jsonDecode(result));
    });

    return officialAccountBean;
  }
}

///获取公众号内容
class WechatDetailRepository {
  Future<ContentEntity> getWxArticleList(
      int officialAccountId, int page) async {
    ContentEntity officialAccountBean;

    await DioUtils.get<Map<String, dynamic>>(WanAndroidApi.getPath2(
            id: officialAccountId,
            page: page,
            path: WanAndroidApi.WXARTICLE_LIST))
        .then((result) {
      officialAccountBean = ContentEntity.fromJson(jsonDecode(result));
    });

    return officialAccountBean;
  }
}

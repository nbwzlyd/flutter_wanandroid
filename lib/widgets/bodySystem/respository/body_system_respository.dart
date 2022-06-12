import 'dart:convert';

import 'package:flutter_app/widgets/bodySystem/bean/project_article_bean.dart';

import '../../api/WanAndroidApi.dart';
import '../../api/util/dio_util.dart';
import '../bean/project_tree_bean.dart';

class BodySystemRespository {
  Future<ProjectTreeBean> getProjectTree() async {
    ProjectTreeBean projectTreeBean;
    await DioUtils.get<Map<String, dynamic>>(
            WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_TREE))
        .then((result) {
      projectTreeBean = ProjectTreeBean.fromJson(jsonDecode(result));
    });

    return projectTreeBean;
  }

  Future<ProjectArticleBean> getProjectArticle(int page ,int cid) async {
    ProjectArticleBean projectArticleBean;
    await DioUtils.get<Map<String, dynamic>>(
        WanAndroidApi.getPath3(path: WanAndroidApi.PROJECT_LIST, page: page,cid: cid))
        .then((result) {
      projectArticleBean = ProjectArticleBean.fromJson(jsonDecode(result));
    });

    return projectArticleBean;
  }
}

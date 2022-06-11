
import 'dart:convert';

import '../../api/WanAndroidApi.dart';
import '../../api/util/dio_util.dart';
import '../bean/ques_and_answer.dart';

///获取问答
class QuesAndAnswerRepository {
  Future<QuesAndAnswerBean> getWendaList(int page) async {
    QuesAndAnswerBean quesAndAnswerBean;
    await DioUtils.get<Map<String, dynamic>>(
        WanAndroidApi.getPath(path: WanAndroidApi.WEN_DA,page: page))
        .then((result) {
      quesAndAnswerBean = QuesAndAnswerBean.fromJson(jsonDecode(result));
    });

    return quesAndAnswerBean;
  }
}

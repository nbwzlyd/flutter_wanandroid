import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/api/util/log.dart';
import 'package:flutter_app/widgets/questionAndAnswer/bean/ques_and_answer.dart';
import 'package:flutter_app/widgets/questionAndAnswer/respository/question_and_answer_repository.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:toast/toast.dart';
import 'widget/ques_and_answer_card_view.dart';

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({Key key}) : super(key: key);

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  StreamController<QuesAndAnswerDeatailBean> _streamController =
      new StreamController();

  QuesAndAnswerDeatailBean mDatas;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    getDetailData(_page);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget staggeredView = EasyRefresh(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount:
            mDatas == null || mDatas.datas == null ? 0 : mDatas.datas.length,
        itemBuilder: (BuildContext build, int index) => QuesAndAnswerView(
            quesAndAnswerDeatailBean: mDatas.datas.elementAt(index)),
        mainAxisSpacing: 3,
        ////纵向元素间距
        crossAxisSpacing: 3,
        //// 横向元素间距
        shrinkWrap: true, //自适应
      ),
      onLoad: () async {
        _page++;
        getDetailData(_page);
      },
    );

    return Center(
      child: StreamBuilder(
        //构建一个任务流
        stream: _streamController.stream,
        builder: (BuildContext ctx,
            AsyncSnapshot<QuesAndAnswerDeatailBean> snapshot) {
          if (snapshot.hasData) {
            return staggeredView;
          }
          if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return staggeredView;
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  getDetailData(int page) {
    QuesAndAnswerRepository().getWendaList(page).then((result) => {
          setState(() {
            if (result.errorCode < 0) {
              _streamController.sink.addError("网络请求出错");
            } else if (result.data.curPage > result.data.pageCount) {
              _streamController.sink.close(); //全部结束
            } else {
              if (result.data.curPage == 1) {
                //第一次请求，赋值
                mDatas = result.data;
              } else {
                mDatas.datas.addAll(result.data.datas);
              }
              _streamController.sink.add(result.data);
            }
          })
        });
  }
}

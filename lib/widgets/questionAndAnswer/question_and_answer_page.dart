import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/api/util/log.dart';
import 'package:flutter_app/widgets/questionAndAnswer/bean/ques_and_answer.dart';
import 'package:flutter_app/widgets/questionAndAnswer/respository/question_and_answer_repository.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:toast/toast.dart';
import 'widget/ques_and_answer_card_view.dart';

class QuestionAndAnswerPage extends StatefulWidget {
  const QuestionAndAnswerPage({Key key}) : super(key: key);

  @override
  State<QuestionAndAnswerPage> createState() => _QuestionAndAnswerPageState();
}

class _QuestionAndAnswerPageState extends State<QuestionAndAnswerPage> {
  StreamController<QuesAndAnswerDeatailBean> _streamController =
      new StreamController();
  AsyncSnapshot<QuesAndAnswerDeatailBean> _snapshot = AsyncSnapshot.waiting();
  QuesAndAnswerDeatailBean mDatas;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    getDetailData();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Widget staggeredView = EasyRefresh(
    //   child: MasonryGridView.count(
    //     crossAxisCount: 2,
    //     itemCount:
    //         mDatas == null || mDatas.datas == null ? 0 : mDatas.datas.length,
    //     itemBuilder: (BuildContext build, int index) => QuesAndAnswerView(
    //         quesAndAnswerDeatailBean: mDatas.datas.elementAt(index)),
    //     mainAxisSpacing: 3,
    //     ////纵向元素间距
    //     crossAxisSpacing: 3,
    //     //// 横向元素间距
    //     shrinkWrap: true, //自适应
    //   ),
    //   onLoad: () async {
    //     _page++;
    //     getDetailData(_page);
    //   },
    // );

    Widget staggeredView = EasyRefresh(
      child: ListView.builder(
          itemCount:
              mDatas == null || mDatas.datas == null ? 0 : mDatas.datas.length,
          itemBuilder: (BuildContext context, int index) => QuesAndAnswerView(
              quesAndAnswerDeatailBean: mDatas.datas.elementAt(index))),
      onLoad: () async {
        _page++;
        getDetailData();
      },
      footer: ClassicalFooter(
          textColor: Colors.blueAccent,
          loadedText: _snapshot.connectionState == ConnectionState.done
              ? "全部加载完毕"
              : "加载成功",
          loadingText: "正在加载中...",
          loadFailedText: "加载失败",
          infoText: "更新于 ${DateTime.now().hour}:${DateTime.now().minute}"),
    );

    return Center(
      child: StreamBuilder(
        //构建一个任务流
        stream: _streamController.stream,
        builder: (BuildContext ctx,
            AsyncSnapshot<QuesAndAnswerDeatailBean> snapshot) {
          _snapshot = snapshot;
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

  getDetailData() {
    QuesAndAnswerRepository().getWendaList(_page).then((result) => {
          setState(() {
            if (result.errorCode < 0) {
              _streamController.sink.addError("网络请求出错");
            } else if (_page >= result.data.pageCount) {
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

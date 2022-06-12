import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/api/util/log.dart';
import 'package:flutter_app/widgets/bodySystem/bean/project_article_bean.dart';
import 'package:flutter_app/widgets/bodySystem/respository/body_system_respository.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:toast/toast.dart';

import '../bean/project_tree_bean.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({Key key}) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  ProjectTreeBean _projectTreeBean;
  int _currCid = -1;
  AsyncSnapshot<ProjectArticleDetailBean> _snapshot;
  StreamController<ProjectArticleDetailBean> _streamController =
  StreamController();

  var _page = 1;

  @override
  void initState() {
    super.initState();
    getProjectTreeBean();
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
        itemCount: _snapshot == null ||
            _snapshot.data == null ||
            _snapshot.data.datas == null
            ? 0
            : _snapshot.data.datas.length,
        itemBuilder: (BuildContext build, int index) {
          var detailBean = _snapshot.data.datas.elementAt(index);
          return Card(
            color: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            shadowColor: Colors.black54,
            child: Column(
              children: [
                new ClipRRect(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 120),
                    child: Image.network(detailBean.envelopePic,
                        scale: 8.5, fit: BoxFit.cover),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(detailBean.title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    detailBean.desc,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                )
              ],
            ),
          );
        },
        mainAxisSpacing: 3,
        ////纵向元素间距
        crossAxisSpacing: 3,
        //// 横向元素间距
        shrinkWrap: true, //自适应
      ),
      onLoad: () async {
        _page++;
        getDetailData(_page, _currCid);
      },
    );

    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: ListView.separated(
              itemCount:
              _projectTreeBean == null || _projectTreeBean.data == null
                  ? 0
                  : _projectTreeBean.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                var treeBean = _projectTreeBean.data.elementAt(index);
                if (_currCid == -1) {
                  //记录下第一个
                  _currCid = treeBean.id;
                }
                return Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text(treeBean.name),
                      onPressed: () {
                        getDetailData(_page, treeBean.id);
                      },
                    ));
              },
              separatorBuilder: (BuildContext ctx, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(5, 2, 2, 5),
                  height: 1,
                  color: Colors.lightBlue[50],
                );
              },
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Center(
            child: StreamBuilder(
              //构建一个任务流
              stream: _streamController.stream,
              builder: (BuildContext ctx,
                  AsyncSnapshot<ProjectArticleDetailBean> snapshot) {
                _snapshot = snapshot;
                if (_snapshot.hasData) {
                  return staggeredView;
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  Toast.show("没有更多数据了~", context);
                  return Center();
                }
              },
            ),
          ),
          flex: 5,
        ),
      ],
    );
  }

  void getDetailData(int _page, int _currCid) {
    if (_page == 0 || _currCid == -1) {
      return;
    }
    BodySystemRespository().getProjectArticle(_page, _currCid).then((value) {
      setState(() {
        _streamController.sink.add(value.data);
      });
    });
  }

  void getProjectTreeBean() {
    BodySystemRespository().getProjectTree().then((value) {
      setState(() {
        _projectTreeBean = value;
        _currCid = _projectTreeBean.data
            .elementAt(0)
            .id;
        getDetailData(_page, _currCid);
      });
    });
  }
}

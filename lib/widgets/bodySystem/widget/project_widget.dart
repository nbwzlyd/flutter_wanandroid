import 'dart:async';

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
  ProjectArticleDetailBean _projectArticleDetailBean;
  StreamController<ProjectArticleDetailBean> _streamController =
      StreamController();

  var _page = 1;
  var _currTotalPage = -1; //当前类目下的最大页数

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
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemCount:
                  _projectTreeBean == null || _projectTreeBean.data == null
                      ? 0
                      : _projectTreeBean.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                var treeBean = _projectTreeBean.data.elementAt(index);
                return Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text(treeBean.name),
                      onPressed: () {
                        _page = 1;
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
                if (snapshot.hasData) {
                  return getStagerdView();
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

  Widget getStagerdView() {
    return EasyRefresh(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: _projectArticleDetailBean == null
            ? 0
            : _projectArticleDetailBean.datas.length,
        itemBuilder: (BuildContext build, int index) {
          var detailBean = _projectArticleDetailBean.datas.elementAt(index);
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
        crossAxisSpacing: 3,
        shrinkWrap: true, //自适应
      ),
      onLoad: () async {
        _page++;
        getDetailData(_page, _currCid);
      },
    );
  }

  void getDetailData(int _page, int _currCid) {
    if (_page == 0 ||
        _currCid == -1 ||
        (_currTotalPage != -1 && _page >= _currTotalPage)) {
      return;
    }
    BodySystemRespository().getProjectArticle(_page, _currCid).then((value) {
      setState(() {
        if (_page == 1) {
          _currTotalPage = value.data.pageCount;
          _projectArticleDetailBean = value.data;
        } else {
          _projectArticleDetailBean.datas.addAll(value.data.datas);
        }
        _streamController.sink.add(_projectArticleDetailBean);
      });
    });
  }

  void getProjectTreeBean() {
    BodySystemRespository().getProjectTree().then((value) {
      setState(() {
        _projectTreeBean = value;
        _currCid = _projectTreeBean.data.elementAt(0).id;
        getDetailData(_page, _currCid);
      });
    });
  }
}

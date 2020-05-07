import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/res/dimens.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/res/styles.dart';
import 'package:flutter_app/widgets/main/bean/ContentEntity.dart';
import 'package:flutter_app/widgets/main/webview_page.dart';

class ContentWidget extends StatelessWidget {
  ContentWidget(this.entity, this.index, {Key key}) : super(key: key);
  final ContentEntity entity;
  final int index;

  String _getUser() {
    if (entity == null || entity.data == null) {
      return "";
    }

    if (entity.data.datas[index].author == null ||
        entity.data.datas[index].author.isEmpty) {
      return entity.data.datas[index].shareUser;
    }
    return entity.data.datas[index].author;
  }

  //_onClick(context, entity.data.datas[index].link,
  //            entity.data.datas[index].title)
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 12, right: 12, top: 8),
        child: InkWell(
            onTap: () {
              _onClick(context, entity.data.datas[index].title,
                  entity.data.datas[index].link);
            },
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(_getUser(), style: TextStyles.textHint14),
                              _buildTags(entity.data.datas[index].tags)
                            ],
                          ),
                        ),
                        Text(
                          entity.data.datas[index].niceShareDate,
                          style: TextStyles.textGray12,
                        )
                      ],
                    ),
                    Gaps.vGap4,
                    Text(
                      entity.data.datas[index].title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Gaps.vGap10,
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          entity.data.datas[index].chapterName,
                          style: TextStyles.textDarkGray14,
                        )),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ]),
            )));
  }

  _onClick(BuildContext context, String title, String url) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new DetailPage(
        url: url,
        title: title,
      );
    }));
  }
}

Widget _buildTags(List<Tags> tags) {
  List<Widget> list = List();
  tags.forEach((tag) {
    list.add(BiaoQian(tag.name));
  });
  return new Row(
    children: list,
  );
}

class BiaoQian extends StatelessWidget {
  BiaoQian(this.content, {Key key}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 6),
          height: 17,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colours.red, width: 0.5)),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 2, right: 2),
            child: Text(
              content,
              style: TextStyle(fontSize: Dimens.font_sp10, color: Colours.red),
            ),
          ),
        )
      ],
    );
  }
}

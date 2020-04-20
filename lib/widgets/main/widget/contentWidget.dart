import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/gaps.dart';

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ContentState();
  }
}

class ContentState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        shape: BoxShape.rectangle,
      ),
      height: 80,
      margin: EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ),
          Expanded(
              child: InkWell(
            child: Column(
              children: <Widget>[
                Text(
                  "【扔物线】消失了半年，这个 Android 界的第一骚货终于回来了",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Gaps.vGap12,
                Row(
                  children: <Widget>[
                    Text("作者:xiaoyang"),
                    Gaps.hGap8,
                    Text("分类:干货资源"),
                    Gaps.hGap8,
                    Text("时间:刚刚"),
                    Gaps.hGap8,
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

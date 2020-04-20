import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/main/widget/HomeBannerWidget.dart';
import 'package:flutter_app/widgets/main/widget/contentWidget.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      HomeBannerWidget(),
      ListView.builder(
          itemBuilder: null)
    ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/main/widget/HomeBannerWidget.dart';
import 'package:flutter_app/widgets/main/widget/HomeWidget.dart';
import 'package:flutter_app/widgets/main/widget/contentWidget.dart';

class MainPage extends StatefulWidget {
  /// 五个Tabs的内容
  final pages = <Widget>[
//    HomeScreen(),
//    SquareScreen(),
//    WeChatScreen(),
//    SystemScreen(),
//    ProjectScreen(),
  ];

  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<StatefulWidget> {
  final bottomBarTitles = ["首页", "广场", "公众号", "体系", "项目"];
  final imageData = List<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget topBanner = Container();
    Widget content = Container();
    Widget bottomTabBar = BottomNavigationBar(items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text(bottomBarTitles[0])),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance), title: Text(bottomBarTitles[1])),
      BottomNavigationBarItem(
          icon: Icon(Icons.school), title: Text(bottomBarTitles[2])),
      BottomNavigationBarItem(
          icon: Icon(Icons.extension), title: Text(bottomBarTitles[3])),
      BottomNavigationBarItem(
          icon: Icon(Icons.android), title: Text(bottomBarTitles[4])),
    ], type: BottomNavigationBarType.fixed);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("wanAndroid"),
      ),
      bottomNavigationBar: bottomTabBar,
      body: HomeWidget());
  }
}

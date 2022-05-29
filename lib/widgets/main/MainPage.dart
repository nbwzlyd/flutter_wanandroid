import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/main/widget/HomeWidget.dart';
import 'package:flutter_app/widgets/user/UserProfilePage.dart';

class MainPage extends StatefulWidget {
  /// 五个Tabs的内容
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<StatefulWidget> {
  final bottomBarTitles = ["首页", "公众号", "体系", "项目", "我的"];
  final imageData = List<String>();
  final pages = <Widget>[
    HomeWidget(),
    HomeWidget(),
    HomeWidget(),
    HomeWidget(),
    UserProfilePage(),
  ];

  int _currentIndex = 0;
  double elevation = 4.0;
  bool _needHideTitle=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomTabBar = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: bottomBarTitles[0]),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), label: bottomBarTitles[1]),
        BottomNavigationBarItem(
            icon: Icon(Icons.school), label: bottomBarTitles[2]),
        BottomNavigationBarItem(
            icon: Icon(Icons.extension), label: bottomBarTitles[3]),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box), label: bottomBarTitles[4])
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: ((index) {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == bottomBarTitles.length - 1) {
            this.elevation = 0;
            _needHideTitle=true;
          } else {
            this.elevation = 4.0;
            _needHideTitle=false;
          }
        });
      }),
    );
    return Scaffold(
        appBar: AppBar(
            elevation: this.elevation,
            centerTitle: true,
            title: Offstage(
              offstage: _needHideTitle,
              child: Text("wanAndroid"),
            )),
        bottomNavigationBar: bottomTabBar,
        body: pages[_currentIndex]);
  }
}

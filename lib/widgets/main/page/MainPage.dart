import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/widgets/bodySystem/body_system_page.dart';
import 'package:flutter_app/widgets/main/SearchWidget.dart';
import 'package:flutter_app/widgets/weChat/official_account_page.dart';
import 'package:flutter_app/widgets/main/widget/HomeWidget.dart';
import 'package:flutter_app/widgets/user/user_profile_page.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:toast/toast.dart';

import '../../questionAndAnswer/question_and_answer_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<StatefulWidget> {
  final bottomBarTitles = ["首页", "体系", "公众号", "问答", "我的"];
  final pages = <Widget>[
    HomePage(),
    BodySystemPage(),
    OfficialAccountPage(),
    QuestionAndAnswerPage(),
    UserProfilePage(),
  ];

  int _currentIndex = 0;

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
            icon: Icon(Icons.question_answer), label: bottomBarTitles[3]),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box), label: bottomBarTitles[4])
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: ((index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
    return Scaffold(
        bottomNavigationBar: bottomTabBar,
        body: LazyLoadIndexedStack(
          index: _currentIndex,
          children: pages,
        ));
  }
}

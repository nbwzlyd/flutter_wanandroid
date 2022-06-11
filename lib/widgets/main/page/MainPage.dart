import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/widgets/main/SearchWidget.dart';
import 'package:flutter_app/widgets/weChat/pages/official_account_page.dart';
import 'package:flutter_app/widgets/main/widget/HomeWidget.dart';
import 'package:flutter_app/widgets/user/user_profile_page.dart';
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
    HomeWidget(),
    HomeWidget(),
    OfficialAccountPage(),
    QuestionAndAnswer(),
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
            icon: Icon(Icons.extension), label: bottomBarTitles[3]),
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
        appBar: PreferredSize(
          child:AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(bottomBarTitles[_currentIndex],style: TextStyle(fontSize: 16),),
            actions: [
              Container(
                width: 50,
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Icon(Icons.search),
                  onTap:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OfficialAccountPage()));
                  },
                ),
                margin: EdgeInsets.only(right: 16),
              )
            ],
          ),
          preferredSize: Size.fromHeight(47),
        ),
        bottomNavigationBar: bottomTabBar,
        body: pages[_currentIndex]);
  }
}

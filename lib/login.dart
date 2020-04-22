import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/gaps.dart';
import 'package:flutter_app/widgets/api/WanAndroidApi.dart';
import 'package:flutter_app/widgets/api/util/dio_util.dart';
import 'package:flutter_app/widgets/login/LoginItem.dart';
import 'package:flutter_app/widgets/login/repository/login_repository.dart';
import 'package:flutter_app/widgets/main/MainPage.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController accountController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  String _pwd, _account;

  @override
  void dispose() {
    accountController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    accountController.addListener(() {
      _account = accountController.text;
    });
    pwdController.addListener(() {
      _pwd = pwdController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("玩Android"),
        ),
        body: new SingleChildScrollView(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Avatar(),
                Gaps.vGap24,
                LoginItem(
                    hintText: "wanAndroid账号",
                    controller: accountController,
                    inputBorder: InputBorder.none),
                LoginItem(
                  hintText: "密码",
                  controller: pwdController,
                  inputBorder: InputBorder.none,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  margin: EdgeInsets.only(top: 15.0, left: 16.0, right: 16.0),
                  child: RaisedButton(
                    child: Text("登录"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 20.0,
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
              ],
            )));
  }

  void _login() {
    LoginRepository().login(
        new LoginBody(_account, _pwd)).then((userBeanData) {
      if (userBeanData.errorCode == -1) {
        Toast.show(
            userBeanData.errorMsg, context, duration: Toast.LENGTH_SHORT,
            gravity: Toast.CENTER);
      } else {
        Toast.show(
            "登录成功", context, duration: Toast.LENGTH_SHORT,
            gravity: Toast.CENTER);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
  }
}
class LoginBody {
  final String accountName;
  final String passWord;
  LoginBody(this.accountName, this.passWord);
  Map<String, String> queryParameters2Map() =>
      {"password": passWord, "username": accountName};
}

//---------头像------------//

class Avatar extends StatefulWidget {
  Avatar({Key key, String title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AvatarState();
  }
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(
          "http://pic31.nipic.com/20130711/8952533_164845225000_2.jpg"),
    );
  }
}

//---------账号密码controller-----------//

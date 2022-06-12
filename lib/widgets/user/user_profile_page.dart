import 'package:flutter/material.dart';
import 'package:flutter_app/res/gaps.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserProfileState();
  }
}

class UserProfileState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    Widget userInfo = Container(
      width: double.infinity,
      height: 190.0,
      padding: EdgeInsets.only(top: 70, left: 16, right: 16),
      color: Colors.blue,
      child: UserProfileWidget(),
    );

    Widget listItems = Container(
      margin: EdgeInsets.only(top: 170),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        children: <Widget>[
          ListItem("我的收藏",
              color: Colors.blue,
              iconData: Icons.bookmark,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()))),
          ListItem("我的文章", color: Colors.red, iconData: Icons.star),
          ListItem("待办清单", color: Colors.greenAccent, iconData: Icons.create),
          Gaps.line,
          ListItem("开源网站", color: Colors.lightBlue, iconData: Icons.language),
          ListItem("加入我们",
              color: Colors.lightGreen, iconData: Icons.insert_emoticon),
          ListItem("系统设置", color: Colors.grey, iconData: Icons.settings),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[userInfo, listItems],
          ),
        ));
  }
}

class UserProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserProfileState2();
  }
}

class UserProfileState2 extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 45.0,
          backgroundImage: NetworkImage(
              "http://api.btstu.cn/sjtx/api.php?lx=c1&format=images&method=mobile"),
        ),
        Gaps.hGap15,
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("账户名",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Gaps.vGap12,
            Row(
              children: <Widget>[
                Text(
                  "积分",
                  style: TextStyle(color: Colors.white),
                ),
                Gaps.hGap15,
                Text("排名", style: TextStyle(color: Colors.white))
              ],
            )
          ],
        )
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem(this.showText,
      {Key key, this.color, this.iconData, this.onTap})
      : super(key: key);
  final IconData iconData;
  final Color color;
  final String showText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        //水波纹无效解决方案
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: new Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            iconData,
                            color: color,
                          ),
                          Gaps.hGap10,
                          Text(
                            showText,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                ))));
  }
}

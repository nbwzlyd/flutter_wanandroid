import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/weChat/widget/we_chat_detail_widget.dart';
import 'bean/official_account_bean.dart';
import 'respository/api_request.dart';
import '../main/widget/tabBarIndicator.dart';

class OfficialAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OfficialAccountState();
  }
}

class _OfficialAccountState extends State<OfficialAccountPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<Account> _officialAccountBean = [];

  @override
  void initState() {
    super.initState();
    _getOfficialTitleData();
    _tabController =
        TabController(length: _officialAccountBean.length, vsync: this);
    _tabController.addListener(() {
      print("tab_select");
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _getOfficialTitleData() {
    WeChatTitleRepository().getWxArticleMemberList().then((value) => setState(() {
          _officialAccountBean.addAll(value.data);
          _tabController =
              TabController(length: _officialAccountBean.length, vsync: this);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.blue,
                centerTitle: true,
                bottom: TabBar(
                  padding: EdgeInsets.only(bottom: 5),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  labelStyle: TextStyle(fontSize: 15),
                  isScrollable: true,
                  indicator: TabBarIndicator(
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  controller: _tabController,
                  tabs: _officialAccountBean.map((value) {
                    return Text(value.name);
                  }).toList(),
                )),
            preferredSize: Size.fromHeight(48)),
        body: TabBarView(
          children: _getOfficialDetailPage(),
          controller: _tabController,
        ));
  }

  List<Widget> _getOfficialDetailPage() {
    List<Widget> mPages = [];
    _officialAccountBean.forEach((element) {
      mPages.add(WeChatDetailWidget(element.id));
    });
    return mPages;
  }
}
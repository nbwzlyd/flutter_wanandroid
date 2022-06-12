import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bodySystem/widget/project_widget.dart';

//体系
class BodySystemPage extends StatefulWidget {
  const BodySystemPage({Key key}) : super(key: key);

  @override
  State<BodySystemPage> createState() => _BodySystemPageState();
}

class _BodySystemPageState extends State<BodySystemPage>
    with TickerProviderStateMixin {
  List<Widget> tabs = [Text("体系"), Text("项目")];
  List<Widget> tabsWidget = [ProjectWidget(), ProjectWidget()];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "体系",
            style: TextStyle(fontSize: 16),
          ),
          bottom: TabBar(
              tabs:tabs,
              controller: _tabController
          ),
        ),
        preferredSize: Size.fromHeight(47),

      ),
      body: TabBarView(
        children: tabsWidget,
        controller: _tabController,
      ),
    );
  }
}

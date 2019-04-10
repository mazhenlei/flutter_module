import 'package:flutter/material.dart';
import 'package:flutter_modulew/image/image.dart';
import 'package:flutter_modulew/image/image_load.dart';
import 'package:flutter_modulew/tablayout/TabPage.dart';
import 'package:flutter_modulew/widget/row.dart';


class TabLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabPageState();
  }
}

class TabPageState extends State<TabLayoutPage>
    with SingleTickerProviderStateMixin {

  TabController _tabController; //控制器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this); //自定义控制器 长度3
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
//          backgroundColor: Colors.blue,
//          title: Text("TabLayout"),
          title: TabBar(
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.red,
              //指示器颜色
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: "ImageLoad",
//                  child: Text("ImageLoad",maxLines: 1, overflow: TextOverflow.ellipsis,),
                  icon: Icon(Icons.assignment_ind),
                ),
                Tab(
                  text: "tab",
                  icon: Icon(Icons.assignment_late),
                ),
                Tab(
                  text: "image",
                  icon: Icon(Icons.assignment_return),
                ),
                Tab(
                  text: "row",
                  icon: Icon(Icons.add),
                ),
              ]
          )
      ),
      body: TabBarView(
              controller: _tabController,
              children: <Widget>[ImageViewWidget(), TabPage(), ImagePage(),PackWidget()
              ]
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

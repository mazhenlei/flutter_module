import 'package:flutter/material.dart';


///TabController --- 这是Tab页的控制器，用于定义Tab标签和内容页的坐标，还可配置标签页的切换动画效果等。

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabState();
  }
}

class TabState extends State<TabPage>  with AutomaticKeepAliveClientMixin{

  final List<Tab> myTabs = <Tab>[
    Tab(text: '明教'),
    Tab(text: '霸刀'),
    Tab(text: '天策'),
    Tab(text: '纯阳'),
    Tab(text: '少林'),
    Tab(text: '藏剑'),
    Tab(text: '七秀'),
    Tab(text: '五毒'),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(  //默认的控制器
      length: myTabs.length,//长度
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: TabBar(//标题
            tabs: myTabs,
            isScrollable: true,//可以滑动
            indicatorColor: Colors.red,
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView( //布局
            children: myTabs
                .map((Tab tab) => Center(child: Text(tab.text)))
                .toList()//组件集合 list.map((Object obj) => Center(child:widget))).toList;
        ),
      ),
    );
  }


  //当页面不显示的时候也常驻在内存中 防止每次都重新创建
  @override
  bool get wantKeepAlive => true;

}
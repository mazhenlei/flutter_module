import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
 * list view  两种实现方式
 */
class ListPage extends StatelessWidget {
  final String title;

  ListPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
//        backgroundColor: Colors.blueGrey, //设置body的背景色
        body: new ListPageWidget());
  }
}

class ListPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
//    return ListPageState();
    return ListViewBuildState(); //第二种实现方式 建议使用 相当于recycleView
  }
}

//普通的实现方式
class ListPageState extends State<ListPageWidget> {
  List<Widget> widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化控件集合
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(children: widgets); //集合用children   ListTile(）
  }

  // 给list item设置属性 设置点击事件 返回widget集合  不需要--adapter
  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("我是第 $i 个条目"),
                new Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fill,
                ),
                new Icon(
                  Icons.favorite,
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 10.0), //间隔 背景色怎么设置？
          ],
        ),
      ),
      onTap: () {
        Fluttertoast.showToast(
          msg: "点击了 $i",
        );
        setState(() {
          widgets = new List.from(widgets); //复制 一份widget
          widgets.add(getRow(widgets.length + 1)); //添加两个item 当前位置和下一个位置的item
        });
      },
    );
  }
}

/*推荐的方法是使用ListView.Builder。当您拥有动态列表或包含大量数据的列表时，此方法非常有用。
这实际上相当于在Android上使用RecyclerView，它会自动为您回收列表元素*/
class ListViewBuildState extends State<ListPageWidget> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widgets.length, //item数量
        itemBuilder: (BuildContext context, int position) {
           if (position.isOdd) return new Divider(); //添加分割线 并且默认给加了加了上下两个padding
          return getRow(position);
        });
  }

  //绘制item布局 带返回值
  Widget getRow(int i) {
    return new GestureDetector(
      child: new Container(
        // padding: new EdgeInsets.all(7.0),//子空间的padding
        child: new Column(children: <Widget>[
          new Row(
            children: <Widget>[
              new Text("我是第 $i个item"),
              new Image.asset(
                'images/logo.png',
                fit: BoxFit.fill,
              ),
              new Icon(Icons.favorite, color: Colors.green),
            ],
          ),
        ]),
//        color: Colors.green,
        decoration: BoxDecoration(color: Colors.blue),
      ),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length + 1));
          Fluttertoast.showToast(
            msg: "点击了 $i",
          );
        });
      },
    );
  }


  //ListTile 是Flutter 给我们准备好的widget 提供非常常见的构造和定义方式，包括文字，icon，点击事件，一般是能够满足基本需求，但是就不能自己定义了
}

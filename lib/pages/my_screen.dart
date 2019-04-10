import 'package:flutter/material.dart';
import 'package:flutter_modulew/net/http_util.dart';
import 'package:flutter_modulew/net/student_services.dart';
import 'package:flutter_modulew/util/ToastUtil.dart';
import 'package:flutter_modulew/util/navigator_util.dart';


class MyPagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础学习'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.menu), //todo 图片可以替换
          tooltip: 'ddd',
          onPressed: () {},
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.account_box),
              onPressed: () {
                NavigatorUtil.goToSecondPage(context, "路由是个好东西，要进一步封装");
              }),
          new IconButton(
            // action button
            icon: new Icon(choices[0].icon),
            onPressed: null,
          ),
          new IconButton(
            // action button
            icon: new Icon(choices[1].icon),
            onPressed: null,
          ),
          new PopupMenuButton<Choice>(
            // overflow menu
            onSelected: null,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                //跳过前两个 这种写法
                return new PopupMenuItem<Choice>(
                  value: choice,
                  child: new Row(
                    children: <Widget>[
                      new Text(choice.title),
                      new Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: new Icon(choice.icon),
                      )
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Colors.yellow,
      ),
      body: MyPageWidget(),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class MyPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyState();
  }
}

class MyState extends State<MyPageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build  Column竖着的 Align  居中就套一层Align--- A widget that aligns its child within itself and optionally sizes itself based on the child's size.
    return new ListView(
      children: <Widget>[
        new Column(
//      mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.center, //内部控件居中
          crossAxisAlignment: CrossAxisAlignment.start, //内部空间左对齐
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToListPage(context, "ListView");
              },
              child: new Text("ListView"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToRandomWordsPage(context);
              },
              child: new Text("RandomWords"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToGridPage(context, "GridView");
              },
              child: new Text("GridView"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToOverLayPage(context);
              },
              child: new Text("overLayAndDialog"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToHomePage(context);
              },
              child: new Text("表单---form"),
            ),
            new RaisedButton(
              onPressed: () {
                HttpUse.httpClient().then((response) {
                  ToastUtil.showToastLong("解析成功" + response.result.toString());
                });
              },
              child: new Text("httpclient"),
            ),
            new RaisedButton(
              onPressed: () {
                LoadJson.loadStudent();
              },
              child: new Text("loadStudent"),
            ),
            new RaisedButton(
              onPressed: () {
                LoadJson.loadBbq();
              },
              child: new Text("loadBbq"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToListPageWithData(context, "网络数据的listview");
              },
              child: new Text("网络数据的listview"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToSlideDrawer(context, "侧滑栏");
              },
              child: new Text("侧滑栏"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToTabLayoutPage(context, "TabLayout");
              },
              child: new Text("TabLayout"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToShareToAppPage(context, "TabLayout");
              },
              child: new Text("ShareToApp"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goToCount(context);
              },
              child: new Text("Counter"),
            ),
            new RaisedButton(
              onPressed: () {
                NavigatorUtil.goFileDemo(context);
              },
              child: new Text("FileDemo"),
            ),
          ],
        )
      ],
    );
  }
}

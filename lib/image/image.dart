

import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageState();
  }

}

class ImageState extends State<ImagePage>{

  double radius = 10.0;

  @override
  void initState() {
    super.initState();
    //改变属性展示动画效果 先变大再变小
    Future<Duration>.delayed(Duration(milliseconds: 2 * 1000), () {
      setState(() {
        radius = 20.0;
      });
      return Duration(milliseconds: 210);
    }).then((Duration d) {
      Future<Duration>.delayed(d, () {
        setState(() {
          radius = 40.0;
        });
        return Duration(milliseconds: 210);
      }).then((Duration d) {
        Future<Duration>.delayed(d, () {
          setState(() {
            radius = 30.0;
          });
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {


    //把widget定义在外面 复用
    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其所有的子节点继承
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        decoration: new BoxDecoration(color: Colors.blue),
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new Icon(Icons.kitchen, color: Colors.green[500]),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.timer, color: Colors.green[500]),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.restaurant, color: Colors.green[500]),
                new Text('FEEDS:'),
                new Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    // TODO: implement build
    return Scaffold(
       body: ListView(
         children: <Widget>[
           CircleAvatar(//显示圆头像
               child: Text("头像"),
//               backgroundImage: AssetImage("images/dart.png"),
               backgroundColor: Colors.red,
               radius: radius,//图片大小
           ),
           iconList,
         ],

       ),
    );
  }


}
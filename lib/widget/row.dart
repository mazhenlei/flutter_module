import 'package:flutter/material.dart';
import 'package:flutter_modulew/util/string_util.dart';

//学习 对齐 垂直和水平放置多个widget
class PackWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PackedRowState();
  }
}

///mainAxisAlignment主轴对齐
class PackedRowState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    //定义一个整体的风格
    var descTextStyle = new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    ///Stack
    var stack = new Stack(
      alignment: const Alignment(0.0, 0.0), //偏移 相对于中心的偏移量 坐标原点在中间
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/icon_main_bg.png'),
          radius: 30.0,
        ),
        new Container(
          height: 30,
          width: 30,
          decoration: new BoxDecoration(
            color: Colors.red,
          ),
          child: new Text(
            'Mia B',
            style: descTextStyle,
          ),
        ),
      ],
    );

    ///Container
    var ratings = new Container(
      color: Colors.brown,
//      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.yellow),
              new Icon(Icons.star, color: Colors.yellow),
              new Icon(Icons.star, color: Colors.yellow),
              new Icon(Icons.star, color: Colors.yellow),
              new Icon(Icons.star, color: Colors.yellow),
            ],
          ),
          new Text('170 Reviews', style: descTextStyle),
        ],
      ),
    );

    ///SizedBox ListTile是Material Components库中的一个专门的行级widget，用于创建包含最多3行文本和可选的行前和行尾图标的行
    var card = new SizedBox(
      height: 210.0,
      child: new Card(
        elevation: 24.0, //设置阴影效果 立体感
        child: new Column(
          children: [
            new ListTile(
              title: new Text('1625 Main Street',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('My City, CA 99984'),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new Divider(), //分割线
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );

    ///限制布局LimitedBox ----根据最大尺寸，限制child的布局，然后将自身调节到child的尺寸。
    ///LimitedBox是将child限制在其设定的最大宽高中的，但是这个限定是有条件的。当LimitedBox最大宽度不受限制时，child的宽度就会受到这个最大宽度的限制，同理高度
    var limited = LimitedBox(
      maxWidth: 150.0, //maxWidth：限定的最大宽度，默认值是double.infinity，不能为负数。
      maxHeight: 150.0, //同上
      child: Container(
        color: Colors.blue,
        width: 300.0,
      ),
    );

    var overFlow = Container(
//      margin: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      color: Colors.green,
      width: 200.0,
      height: 200.0,
//      padding: const EdgeInsets.all(5.0),
      child: OverflowBox(
        alignment: Alignment.topLeft, //居中显示 对齐方式
        maxWidth: 300.0,
        maxHeight: 500.0,
        child: Container(
          color: Color(0x33FF00FF),
          width: 400.0,
          height: 400.0,
        ),
      ),
    );

    var leftColumn = new Container(
//      color: Colors.blueGrey,
//      decoration: BoxDecoration(),//定义一些圆角 shape属性等等
//      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,//左对齐
        children: [
          ratings,
          stack,
          card,
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: limited,
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: overFlow,
          ),

        ],
//        children: <Widget>[
//          ratings,
//          stack,
//          card,
//          limited
//        ],
      ),
    );

//    Strings.isShowOffstage=true;//赋值 控制布局显示
    //Offstage的作用很简单，通过一个参数，来控制child是否显示，日常使用中也算是比较常用的控件。 true代表不显示
    ///当offstage为true，当前控件不会被绘制在屏幕上，不会响应点击事件，也不会占用空间；
    ///当offstage为false，当前控件则跟平常用的控件一样渲染绘制；
    return Offstage(
      offstage: Strings.isShowOffstage,
      child: new SingleChildScrollView(
        child: leftColumn,
      ),
    );
  }
}

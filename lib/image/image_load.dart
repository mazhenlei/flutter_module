import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modulew/text/edit_text_element.dart';
import 'package:flutter_modulew/text/text_element.dart';
import 'package:flutter_modulew/util/ToastUtil.dart';
import 'package:transparent_image/transparent_image.dart';

//定义全局变量
NetworkImage networkImage = new NetworkImage(
    "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg",
    scale: 8.5);

//图片加载
class ImageViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageState();
  }
}

class _ImageState extends State<ImageViewWidget> {
  var imageUrl =
      "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg";

  var imageUrl2 =
      "http://n.sinaimg.cn/sports/2_img/upload/4f160954/107/w1024h683/20181128/Yrxn-hpinrya6814381.jpg";

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ListView(//属性垂直 纵向 在Flutter中，一个ListView既是一个ScrollView，也是一个Android ListView
        padding: const EdgeInsets.all(10.0), //listView设置padding
        children: <Widget>[
          new Text("网络图片"),
          new Row(//行
//              mainAxisAlignment: MainAxisAlignment.center, //居中显示
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Image(
                        image: networkImage) //显示网络图片 如果定义到widget中就用 widget.networkImage引用
                    )
              ]),
          new Text("本地图片加载"),
          new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0), //上下左右都是10.0
                  child: Image.asset(
                    //加载项目目录图
                    'images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
//                new Image.file(//第二种实现方式加载本地图片 uri
//                  File('/storage/emulated/0/Download/test.jpg'), //本地路径
//                  width: 120,
//                  //fill(全图显示且填充满，图片可能会拉伸)，contain（全图显示但不充满，显示原比例），cover（显示可能拉伸，也可能裁剪，充满）
//                  //fitWidth（显示可能拉伸，可能裁剪，宽度充满），fitHeight显示可能拉伸，可能裁剪，高度充满），scaleDown（效果和contain差不多，但是）
//                ),
              ]
          ),
          new Text('网络占位图片FadeInImage'),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            //设置距离上面控件的padding 距离
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrl,
//                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: new FadeInImage.assetNetwork(
                    placeholder: 'images/logo.png',
                    image: imageUrl,
//                    width: 80,
                    fit: BoxFit.fitWidth,
                  ),
                  flex: 1,
                ),
//                new Expanded(
//                  child: new Padding(
//                    //设置padding
//                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
//                    //参数左上右下
//                    child: new FadeInImage.assetNetwork(
//                      placeholder: 'images/logo.png',
//                      image: imageUrl,
//                      width: 120,
//                      fit: BoxFit.fitWidth,
//                    ),
//                  ),
//                  flex: 1,
//                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0), //距离上面40
//            child: new Center(//居中显示
              child: new RaisedButton(//按钮
                onPressed: () {
                  setState(() {
                    networkImage =
                        new NetworkImage(imageUrl2, scale: 8.5); //更换image
                  });
                },
                child: Text('点击更换图片'),
              ),
//            ),
          ),

          new RaisedButton(//按钮
            onPressed: null,//不可点击会自己动变灰色
            child: Text('点击更换图片'),
          ),

          new TextField(//输入框
            decoration: InputDecoration(
              hintText: 'icon设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              icon: Icon(Icons.phone), //设置按钮
            ),
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start, //左对齐
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Widget控件集合 相当于LinearLayout
              // 如果Widget不支持事件监听，则可以将该Widget包装到GestureDetector中，并将处理函数传递给onTap参数
//              new Expanded(
//                child: new Container(
//                  child: new Icon(
//                    Icons.access_time,
//                    size: 50.0,
//                  ),
//                  color: Colors.red,
//                ),
////                flex: 2,
//              ),

              //按照权重放置
              new Expanded(
                child: new GestureDetector(
                  //给text加点击事件
                  child: Text(
                    "TextFiled组件详解--EditText",
                    overflow: TextOverflow.ellipsis, //超出屏幕显示省略号
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (_) {
                      return new EditTextElement(title: "EditText"); //构造传参
                    }));
                  },
                ),
                flex: 1,
              ),

              new Expanded(
                child: new GestureDetector(
                  //给text加点击事件
                  child: Text(
                    "Text组件详解",
                    softWrap: true, //自动换行
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (_) {
                      return new TextElement(title: "Text"); //构造传参
                    }));
                  },
                ),
                flex: 1,
              ),

              new Expanded(
                child: new RaisedButton(
                  //按钮
                  onPressed: () {
                    ToastUtil.showToastLong("我是一个按钮");
                  },
                  child: Text('button'),
                ),
                flex: 1,
              ),

              new Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: new Container(
                    width: 100,
                    child: new Text(
                      "字太多了少时诵诗书所所所大大大大",
                      overflow: TextOverflow.ellipsis, //超出屏幕显示省略号
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modulew/util/ToastUtil.dart';


class SnackBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SnackBarPageState();
  }
}

class SnackBarPageState extends State<SnackBarPage> {
  static Widget ww = new Container(
    child: new Text('screenshot'),
  );

  GlobalKey globalKey = new GlobalKey(); //组件的key 存在map里 一一对应

  Future<void> _capturePng() async {
//     RenderRepaintBoundary boundary =
//         globalKey.currentContext.findRenderObject();
//     ui.Image image = await boundary.toImage();
//     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData.buffer.asUint8List();
//     print(pngBytes);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('SnackBar'),
        ),
        body: new Builder(builder: (BuildContext context) {
          return new RepaintBoundary(
            key: globalKey,
            child: new Center(
              child: new GestureDetector(
                onTap: () {//手势监听点击
                  ToastUtil.showToast(context);
                },
                child: new Text('显示SnackBar'),
              ),
            ),
          );
        }));
  }
}

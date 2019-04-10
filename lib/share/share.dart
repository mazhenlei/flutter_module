import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_modulew/util/ToastUtil.dart';

///系统交互 分享---https://juejin.im/post/5b6c63696fb9a04fbf273ce6   以及跳转到原生和带参数跳转
class ShareToAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShareAppState();
  }
}

class ShareAppState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Sharing();
  }
}


class Sharing extends State<ShareAppState> {

  String _talkStrs = "你还看？？";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: testShare
          )
        ],
      ),
      body: new Center(
        child:new Column(
          children: <Widget>[
            Text(_talkStrs),

            new GestureDetector(
              child: Text("跳转到原生"),
              onTap: _jumpToNative,
            ),

            new GestureDetector(
              child: Text("带参数跳转到原生"),
              onTap: _jumpToNativeWithValue,
            )

          ],
        )

      ),

    );
  }

  ///MethodChannel和原生交互
  Future<void> testShare() async {
    try {
      final channel = const MethodChannel('channel:Share');

      final String nativeSay = await channel.invokeMethod('ShareFile', '你好native，我是flutter，提前祝七夕快乐');

      print("$nativeSay");

      setState(() {
        _talkStrs = nativeSay;
      });

    } catch(e) {
      print(e.toString());
    }

  }

  //获取到插件与原生的交互通道
  static const jumpPlugin = const MethodChannel('com.jzhu.jump/plugin');

  Future<Null> _jumpToNative() async {
    String result = await jumpPlugin.invokeMethod('oneAct');//传入方法名 带返回值跳转

    print(result);//输出返回参数

    ToastUtil.showToastLong("oneAct"+result);
  }

  Future<Null> _jumpToNativeWithValue() async {

    Map<String, String> map = { "flutter": "这是一条来自flutter的参数" };

    String result = await jumpPlugin.invokeMethod('twoAct', map);//传入一个集合

    print(result);

    ToastUtil.showToastLong("oneAct"+result);//跳转成功之后就会弹出来
  }

}

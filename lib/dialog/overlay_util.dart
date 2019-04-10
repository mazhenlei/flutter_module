import 'package:flutter/material.dart';

/// 注意区分overLay和dialog的区别  悬浮控件 和 弹窗

/// OverlayEntry用来创建悬浮控件的对象
class OverlayDialog {
  static void showOverlayOne(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.pinkAccent,
        ),
      );
    });
    OverlayEntry overlayEntry2 = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: 50.0,
          width: 100.0,
          color: Colors.tealAccent,
        ),
      );
    });

    overlayState.insert(overlayEntry);
    overlayState.insert(overlayEntry2);

    await Future.delayed(Duration(seconds: 2)); //两秒后 自动消失

    overlayEntry.remove();
    overlayEntry2.remove();
  }

  static void showOverlayTwo(BuildContext context) async {
    Color color = Colors.pinkAccent;
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        maintainState: true,
//        opaque: true, //单独浮层 遮挡当前界面
        builder: (context) {
          return Opacity(
            //Opacity  A widget that makes its child partially transparent.
            opacity: 0.5, //透明度
            child: Scaffold(
              body: Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: color,
                ),
              ),
            ),
          );
        });

    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 2)); //两秒后修改颜色
    color = Colors.tealAccent;
    overlayEntry.markNeedsBuild();
    await Future.delayed(Duration(seconds: 2)); //移除
    overlayEntry.remove();
  }

  static void showOverlayThree(BuildContext context) {
    OverlayState overlayState = Overlay.of(context); //初始化状态
    final RenderBox box = context.findRenderObject();
    final Offset target = box.localToGlobal(box.size.center(Offset.zero));
    final height = 100.0;
    final width = 100.0;
    //构建悬浮
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: target.dy - height / 2,
        left: target.dx - width / 2,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Material(child: Text('${target.toString()}')), //仅仅展示一个文字
        ),
      );
    });
    overlayState.insert(overlayEntry);
    Future.delayed(Duration(seconds: 1)).then((_) {
      overlayEntry.remove();
    });
  }

  ///防微信下来菜单
  static void showPopView(BuildContext context) {
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned( //位置
          top: kToolbarHeight, //距离顶部的距离 toolbar的高度
          right: 0, // 距离右边的距离
          width: 200,
//          height: 100,
          child: new SafeArea( //一个小部件，通过足够的填充来保护其子节点，以避免入侵
              child: new Material(
                child: new Container(
                  height: 100,
                  color: Colors.black,
                  child: new Column(
                    children: <Widget>[
                      Expanded(
                        child: new ListTile(
                          leading: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          title: new Text(
                            "发起群聊",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: new ListTile(
                          leading: Icon(Icons.add, color: Colors.white),
                          title: new Text("添加朋友",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              )));
    });
    Overlay.of(context).insert(overlayEntry);
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }

  ///自定义弹窗
  static void showMyOverLay(BuildContext context) {
    OverlayEntry overlayEntry = new OverlayEntry(
        builder: (context) {
          return new ListView.builder(
             itemCount: 1,
             itemBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:  Container(  //黑色矩形容器
                   alignment: Alignment.center,
                   height: 200,
                   color: Colors.black.withOpacity(0.2),
                   child: Row(
                     children: <Widget>[
                       new GestureDetector(
                           onTap: null,
                           child: new Text("确定",
                             style: TextStyle(
                             color: const Color(0xfff2c2b2),
                             fontSize: 17,
                           ),
                           ),
                       ),
                       new GestureDetector(
                         onTap:(){
//                           Navigator.of(context).pop(true);
                         },
                         child:  new Text("取消"),
                       ),

                     ],
                   ),
                 ),
               );
             },
          );
        }
    );
    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 2)).then((_) {
      overlayEntry.remove();
    });

  }

  /// 默认 提供的弹窗  实现弹窗用这个方式更合适
  static void showMyDialog(BuildContext context,bool showing) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {//构造器
        return AlertDialog(
          title:  Text("标题"),
          content: const Text(
            'Message',
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );

        //自己定义弹窗 宽高都可以定义
//      return new SimpleDialog(
//        title: new Text('Test'),
//        children: <Widget>[
//          new RadioListTile(
//            title: new Text('Testing'), value: null, groupValue: null, onChanged: (value) {},
//          )
//        ],
//      );
      },
    );
  }
}
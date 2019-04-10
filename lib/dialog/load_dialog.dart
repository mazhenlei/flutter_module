import 'package:flutter/material.dart';


///自定义dialog
// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String loadingText;
  bool outsideDismiss;
  Function dismissCallback;

  //构造方法
  LoadingDialog(
      {Key key,
      this.loadingText = "loading...",
      this.outsideDismiss = true,//点击外部可以消失
      this.dismissCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _dismissDialog() {
      if (dismissCallback != null) {
        dismissCallback();
      }
      Navigator.of(context).pop(); //隐藏dialog 就是返回上一个widget
    }
    return new GestureDetector(
      onTap: outsideDismiss ? _dismissDialog : null,//点击事件 dialog整体
      child: Material(
        type: MaterialType.transparency,
        child: new Center(
//          child: new SizedBox(
//            width: 120.0,
//            height: 120.0,
            child: new Container(
              width: 120.0,
              height: 120.0,
              decoration: ShapeDecoration(  //颜色 圆角
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(),//圆的进度条
                  new Padding(
                    padding: const EdgeInsets.only(//创建只有给定值非零的插入 必须非零
                      top: 20.0,
                    ),
                    child: new Text(
                      loadingText,
                      style: new TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
//          ),
        ),
      ),
    );
  }
}

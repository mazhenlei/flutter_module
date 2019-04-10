import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(BuildContext context) {
//    Scaffold.of(context).showSnackBar(
//      SnackBar(
//        content: const Text('Added to favorite'),
//        action: SnackBarAction(
//            label: 'UNDO', onPressed: Scaffold
//            .of(context)
//            .hideCurrentSnackBar),
//      ),
//    );
//    final snackBar = new SnackBar(content: new Text('这是一个SnackBar'));
//    Scaffold.of(context).showSnackBar(snackBar);

    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  static void showToastLong(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }
}

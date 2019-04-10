import 'package:flutter/material.dart';

//自定义一个view 用法: body: CustomPaint(
//        painter: StarView(),
//      ),
class StarView extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';

///双击旋转
class SampleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPage();
  }
}

//SingleTickerProviderStateMixin 加上之后才能用this
class TestPage extends State<SampleApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this); //设置时长
    curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn); //旋转动画
    super.initState(); //这句话要加上
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(//局中显示
        child: new GestureDetector(//手势监听
        child: new RotationTransition( //旋转小部件
            turns: curve,
            child: new FlutterLogo(
              size: 200.0,
            )),
        onDoubleTap: () {
          if (controller.isCompleted) {
            controller.reverse(); //复位
          } else {
            controller.forward(); //开启
          }
        },
      ),
     )
    );
  }
}

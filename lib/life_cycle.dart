import 'package:flutter/material.dart';


///组件的生命周期
class LifeCycle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LifeState();
  }
}

class LifeState extends State<LifeCycle>{

  ///初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  ///组件状态更新 ---重新build
  @override
  void didUpdateWidget(LifeCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  ///移除组件
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  ///销毁
  @override
  void dispose() {
    // TODO: implement dispose 这个函数一般会移除监听，清理环境
    super.dispose();
  }
}
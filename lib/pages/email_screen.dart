import 'package:flutter/material.dart';
import 'package:flutter_modulew/tablayout/tab_bar.dart';

class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '基础控件的使用',
          style: TextStyle(
            color: Colors.blue, //字体颜色
            fontWeight: FontWeight.bold,//加粗
//            fontStyle: FontStyle.italic,  //斜体
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: TabLayoutPage(),
    );
  }
}

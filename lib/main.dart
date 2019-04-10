import 'package:flutter/material.dart';
import 'package:flutter_modulew/slide/intro_slider_demo.dart';


//程序主入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();//使用新包 随机字符
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new SliderScreen(),

//      routes: <String, WidgetBuilder> {
//        // 这里可以定义静态路由，不能传递参数
//        '/router/second': (_) => new SecondPage(),
//        '/router/home': (_) => new RouterHomePage(),
//        '/router/first': (_) => new SampleAppPage(),
//      },
    );
  }

//            Navigator.of(context).pushNamed('/router/second').then((value) {
//
//            });
}
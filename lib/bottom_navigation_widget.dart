import 'package:flutter/material.dart';
import 'package:flutter_modulew/pages/email_screen.dart';
import 'package:flutter_modulew/pages/home_screen.dart';
import 'package:flutter_modulew/pages/my_screen.dart';
import 'package:flutter_modulew/pages/pages_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue; //定义导航栏颜色 默认图标是灰色
  int _currentIndex = 0;
  List<Widget> list = List(); //创建组件集合
  List<Widget> list1 = []; //创建组件集合  第二种定义方式

  //shdsahd
  var _pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(MyPagesScreen());
//    list1.add(HomeScreen());
    super.initState();
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    var image=Image.asset("images/flutterlogo.png", width: 24.0, height: 24.0);

    return Scaffold(
//      body: list[_currentIndex],//装界面 切换body  下面是配合viewpager实现
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return list[index];
        },
        itemCount: list.length,
      ),

//      body: new PageView(//第二种方式
//        onPageChanged: _pageChange,
//        controller: _pageController,
//        children: list,
//      ),

      bottomNavigationBar: BottomNavigationBar(//底部导航栏 官方提供的
        items: [
          BottomNavigationBarItem(
//              backgroundColor: Colors.cyanAccent,  //导航栏设置背景色 必须在这里设置才有效
              activeIcon: image,
              icon:Icon(//选中状态 未选中
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'HOME',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              activeIcon: image,
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              activeIcon: image,
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'PAGES',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              activeIcon: image,
              icon: Icon(
                Icons.airplay,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Random',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed, //类型风格  展示text
      ),
    );
  }

  // bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {// 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
}

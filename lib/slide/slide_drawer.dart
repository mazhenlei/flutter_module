import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modulew/slide/slide_container.dart';

///仿qq自定义的侧滑栏
class SlidePage extends StatelessWidget {
  final String title;

  const SlidePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: _Body(),
        ),
      );
}

class _Body extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<_Body> {
  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.7;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>(); //根据key 获取组件状态调用

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    height = MediaQuery.of(context).size.height - statusBarHeight;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),//距离顶部的margin 距离
      child: SlideStack(
        drawer: DrawerPage(),//侧滑后的页面
        child: SlideContainer(
          key: _slideKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height * (1 - position / 5),
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  title: 'Slide Drawer',
                  height: kToolbarHeight * (1 - position / 5),
                  tapDrawer: () {//点击事件
                    _slideKey.currentState.openOrClose();
                  },
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(  ///定义Container的一些颜色值 渐变色 圆角等等 shape
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.pinkAccent,
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          slideDirection: SlideDirection.left,
          onSlide: onSlide,
          drawerSize: maxSlideDistance,
          transform:
              Matrix4.translationValues(0.0, height * position / 10, 0.0),
        ),
      ),
    );
  }
}

///自定义appbar
class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback tapDrawer;
  final double height;

  const CustomAppBar({Key key, this.title, this.tapDrawer, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: height,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: tapDrawer,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 20.0),
              child: Icon(
                Icons.dehaze,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuInfo {
  final String title;
  final IconData icon;

  _MenuInfo({this.title, this.icon});
}

final List<_MenuInfo> menus = [
  _MenuInfo(title: '了解会员特权', icon: Icons.accessibility),
  _MenuInfo(title: 'QQ钱包', icon: Icons.account_balance_wallet),
  _MenuInfo(title: '个性装扮', icon: Icons.format_paint),
  _MenuInfo(title: '我的相册', icon: Icons.photo_album),
];


///侧滑后的页面
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.plus,
          image: DecorationImage(
              image: AssetImage('images/2018.jpg'),
              fit: BoxFit.fill
          ),
          color: Colors.white
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          padding: EdgeInsets.only(top: 80.0, left: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: FlutterLogo(
                      colors: Colors.pink,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'MaZhenLei',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                menus[index].icon,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                menus[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.25)),
        ),
      ),
    );
  }
}

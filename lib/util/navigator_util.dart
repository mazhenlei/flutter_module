import 'package:flutter/material.dart';
import 'package:flutter_modulew/dialog/dialog_widget.dart';
import 'package:flutter_modulew/file/fileUtil.dart';
import 'package:flutter_modulew/form_pop_demo.dart';
import 'package:flutter_modulew/list/grid_view.dart';
import 'package:flutter_modulew/list/list_view.dart';
import 'package:flutter_modulew/list/list_view_with_data.dart';
import 'package:flutter_modulew/list/random_list_page.dart';
import 'package:flutter_modulew/router_demo/second_page.dart';
import 'package:flutter_modulew/share/share.dart';
import 'package:flutter_modulew/slide/slide_drawer.dart';
import 'package:flutter_modulew/tablayout/tab_bar.dart';
import 'package:flutter_modulew/util/ToastUtil.dart';
import 'package:flutter_modulew/widget/counter.dart';


///定义一个类  处理动态路由跳转
class NavigatorUtil{

  ///标准跳转
  static void goToRandomWordsPage(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new RandomWordsPage();
    }));
  }

  ///悬浮控件 以及弹窗
  static void goToOverLayPage(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new OverLayPage();
    }));
  }

  ///带参数跳转
  static void goToGridPage(BuildContext context, String title){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new GridPage(title: title);
    }));
  }

  ///list view
  static void goToListPage(BuildContext context, String title){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new ListPage(title: title,);
    }));
  }

  ///带返回值跳转
  static void goToSecondPage(BuildContext context, String title){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new SecondPage(title: '路由是个好东西，要进一步封装');
    })).then((value) {
      ToastUtil.showToastLong(value);
    });
  }

  ///去首页
  static void goToHomePage(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: new MyHomePage(),
      );
    }));
  }

  ///list view with data
  static void goToListPageWithData(BuildContext context, String title){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new ListPageWithData(title: title,);
    }));
  }

  ///仿qq侧滑栏
  static void goToSlideDrawer(BuildContext context, String title){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new SlidePage(title: title,);
    }));
  }

  ///tabLayout
  static void goToTabLayoutPage(BuildContext context, String title){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new TabLayoutPage();
    }));
  }

  static void goToShareToAppPage(BuildContext context, String s) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return  ShareToAppPage();
    }));
  }

  static void goToCount(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new Counter();
    }));
  }

  static void goFileDemo(BuildContext context){
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new FileDemo();
    }));
  }

}
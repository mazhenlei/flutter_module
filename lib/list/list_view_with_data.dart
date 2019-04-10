import 'package:flutter/material.dart';
import 'package:flutter_modulew/dialog/load_dialog.dart';
import 'package:flutter_modulew/net/http_util.dart';
import 'package:flutter_modulew/net/model/bbq_person_model.dart';

/*
 * list view  两种实现方式
 */
class ListPageWithData extends StatelessWidget {
  final String title;

  ListPageWithData({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
//        backgroundColor: Colors.blueGrey, //设置body的背景色
        body: new ListPageWidget());
  }
}

class ListPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewBuildState(); //第二种实现方式 建议使用 相当于recycleView
  }
}

/*推荐的方法是使用ListView.Builder。当您拥有动态列表或包含大量数据的列表时，此方法非常有用。
这实际上相当于在Android上使用RecyclerView，它会自动为您回收列表元素*/
class ListViewBuildState extends State<ListPageWidget> {
  List widgets = [];

  BbqPerson bbqPerson = new BbqPerson();

  List<DataBean> dataList = new List();

  bool _loading = true; //默认显示进度条

  @override
  void initState() {
    super.initState();
    //异步网络请求
    HttpUse.httpClient().then((response) {
      bbqPerson = response;
      dataList = response.data;
      for (int i = 0; i < dataList.length; i++) {
        widgets.add(ListItemWidget(dataList[i]));
      }
      //刷新界面
      setState(() {
        _loading = !_loading;
      });
    });
  }

  ///加载进度 请求成功再替换布局
  Widget _childLayout() {
    if (_loading) {
      return LoadingDialog();
//      return Center(
//        child: Container(
//          child: CircularProgressIndicator(),
//        ),
//      );
    } else {
      return new ListView.builder(
          itemCount: widgets.length, //item数量
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd)
              return new Divider(); //添加分割线 并且默认给加了加了上下两个padding
            return ListItemWidget(dataList[position]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _childLayout();
  }

//ListTile 是Flutter 给我们准备好的widget 提供非常常见的构造和定义方式，包括文字，icon，点击事件，一般是能够满足基本需求，但是就不能自己定义了
}

//创建item 布局
class ListItemWidget extends StatelessWidget {
  final DataBean dataBean;

  ListItemWidget(this.dataBean); //构造传参

  @override
  Widget build(BuildContext context) {
    //(dataBean.rank == "1" ? "胜利" :"失败")
    return new ListTile(
      title: new Text(dataBean.nickname + "---名次" + dataBean.rank,
          style: TextStyle(color: Colors.green)),
      subtitle:
          new Text(dataBean.fight_level, style: TextStyle(color: Colors.black)),
      leading: new FadeInImage.assetNetwork(
        placeholder: 'images/moren_touxiang.png',
        image: dataBean.hero_type_id,
        width: 50,
        height: 50,
        fit: BoxFit.fitWidth,
      ),
      trailing: new FadeInImage.assetNetwork(
        placeholder: 'images/moren_touxiang.png',
        image: dataBean.achieve_id,
        width: 50,
        height: 50,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

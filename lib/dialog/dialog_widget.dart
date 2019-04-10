import 'package:flutter/material.dart';
import 'package:flutter_modulew/dialog/load_dialog.dart';
import 'package:flutter_modulew/dialog/overlay_util.dart';

class OverLayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('悬浮控件显示'),
        backgroundColor: Colors.yellow,
      ),
      body: OverLayWidget(),
    );
  }
}

class OverLayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OverState();
  }
}

class OverState extends State<OverLayWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,//内部空间左对齐
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
            OverlayDialog.showOverlayOne(context);
          },
          child: new Text("OverLayOne"),
        ),
        new RaisedButton(
          onPressed: () {
            OverlayDialog.showOverlayTwo(context);
          },
          child: new Text("OverLayTwo"),
        ),
        new RaisedButton(
          onPressed: () {
            OverlayDialog.showOverlayThree(context);
          },
          child: new Text("OverLayThree"),
        ),
        new RaisedButton(
          onPressed: () {
            OverlayDialog.showPopView(context);
          },
          child: new Text("OverLayPopView"),
        ),
//        new RaisedButton(
//          onPressed: () {
//            OverlayDialog.showMyOverLay(context);
//          },
//          child: new Text("showMyOverLay"),
//        ),
        new RaisedButton(
          onPressed: () {
            OverlayDialog.showMyDialog(context, true);
          },
          child: new Text("showMyDialog"),
        ),
        new RaisedButton(
          onPressed: () {
            _showLoadingDialog();
          },
          child: new Text("loadingDialog"),
        ),
      ],
    );
  }

  ///展示弹窗
  _showLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new LoadingDialog(
            dismissCallback: () {
              print("dismiss");
            },
          );
        });
  }
}

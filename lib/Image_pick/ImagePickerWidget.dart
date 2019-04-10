import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

///拍照 图库选择
class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> with AutomaticKeepAliveClientMixin {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //可以装标题 body 以及导航栏 悬浮按钮等复杂的组件
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("ImagePicker"),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "search",
                  );
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ImageView(_imgPath),
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed: _openGallery,
                child: Text("选择照片"),
              ),
            ],
          ),
        ));
  }

  /*图片控件*/
  // ignore: non_constant_identifier_names
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera); //耗时操作

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  @override
  // TODO: implement wantKeepAlive 状态保活
  bool get wantKeepAlive => true;
}

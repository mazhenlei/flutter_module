import 'package:flutter/material.dart';

class EditTextElement extends StatelessWidget {

  final String title;

  EditTextElement({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: new EditTextWidget());
  }
}

class EditTextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _EditTextWidget();
  }
}

class _EditTextWidget extends State<EditTextWidget> {
  FocusNode _focusNode = new FocusNode();

  TextEditingController _textEditingController = new TextEditingController();

  //销毁
  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  //初始化
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusNodeListener);
  }

  //获取焦点的监听
  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      print('获取焦点');
    } else {
      print('失去焦点');
    }
  }

  // 创建  TextField相当于editText
  @override
  Widget build(BuildContext context) {
    return new Align(
      //对齐 基于孩子的大小
      child: ListView(
        children: <Widget>[
          new TextField(
            controller: _textEditingController,
          ),
          new RaisedButton(
            onPressed: () {
              print(_textEditingController.text);
              _textEditingController.clear();
            },
            child: Text('清除'),
          ),
          new TextField(
            decoration: InputDecoration(
              //输入描述
              hintText: '焦点设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            focusNode: _focusNode,
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: 'icon设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              icon: Icon(Icons.phone),
            ),
          ),
          new TextField(
            decoration: InputDecoration(
              labelText: '请输入手机号',
              prefixIcon: Icon(Icons.phone),
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: '输入法设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: '明文/密文设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            obscureText: true,
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: '右下角按钮设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            textInputAction: TextInputAction.previous,
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: '输入大小写设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            textCapitalization: TextCapitalization.characters,
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: '监听输入设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            onChanged: (String content) {
              print('content--->$content');
            },
          ),
          new TextField(
            decoration: InputDecoration(
              hintText: '光标设置',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            cursorColor: Colors.purple,
            cursorWidth: 6,
            cursorRadius: Radius.elliptical(2, 8),
          ),
        ],
      ),
    );
  }
}

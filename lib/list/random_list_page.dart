import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///显示随机单词 用列表展示
class RandomWordsPage extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

//实现一个有状态的widget
class RandomWordsState extends State<RandomWordsPage> {
  //下划线代表私有
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0); //字体大小
  final _saved = new Set<WordPair>(); //新的单词对 set不允许重复

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RandomWordsScreen'),
      ),
      body: _buildSuggestions(),
    );
  }

  //带返回值 方法1 创建一个listView
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  //方法2
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair); //判断是否包含
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      leading: new Icon(
              Icons.access_alarm,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() { //在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
          if (alreadySaved) {
            _saved.remove(pair);
            Fluttertoast.showToast(
              msg: "已取消",
            );
          } else {
            _saved.add(pair);
            Fluttertoast.showToast(
              msg: "已收藏",
            );
          }
        });
      }, //点击事件
    );
  }


}
// 父级组件
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import './children.dart';

class ParentWidget extends StatefulWidget {
  @override
  // 父组件创状态
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  // bool _active = false;
  // void _handleChange(bool newState) {
  //   setState(() {
  //     _active = newState;
  //   });

  // 列表，可以拥有重复的数据
  final _suggestion = <WordPair>[];
  // 收藏列表，Set集合是不允许有重复的数据
  final _saved = new Set<WordPair>();
  // 提取公共的样式
  final _biggerFont = const TextStyle(fontSize: 20.0);
  // 跳转到新的手收藏页面
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((item) {
        return new ListTile(
            title: Text(
          item.asPascalCase,
          style: _biggerFont,
        ));
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: titles).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget _buildRow(WordPair pair) {
    // 检查确保单词对还没有添加到收藏夹中。
    final alreadySaved = _saved.contains(pair);
    //  asPascalCase 首字母大写
    return new ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      // 添加收藏爱心
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      // 点击事件
      onTap: () {
        // 触发跟新
        setState(() {
          alreadySaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }

  // 返回列表
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          if (index >= _suggestion.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestion.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestion[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('startup name generatory'),
          // 添加一个列表的图标和跳转的事件
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            ),
          ],
        ),
        body: _buildSuggestions());
  }
}

// @override
// Widget build(BuildContext context) {
//   // 把父级的 state 和 函数 传递给子级， 然后在通过子级调用父级的函数，把state状态，通过函数传递回来
//   return new ChildrenWidget(active: _active, onChange: _handleChange);
// }
// }

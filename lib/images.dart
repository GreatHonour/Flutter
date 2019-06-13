import 'package:flutter/material.dart';
// 加载json 文件，异步
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class SetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future === Promise 异步操作
    // async await === js的 async
    // 异步请求json 文件
    Future<Object> loadAssets() async {
      return await rootBundle.loadString('assets/json/bg.json');
    }

    loadAssets().then((data) {
      print(data);
    });

    return new Container(
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('添加图片'),
              Image.asset('assets/images/bg.png'),
            ],
          ),
        ),
        decoration: new BoxDecoration(color: Colors.white));
  }
}

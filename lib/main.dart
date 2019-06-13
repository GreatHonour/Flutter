import 'package:flutter/material.dart';
import './home.dart';
import './appBar/appBar.dart';
import 'appBar/appBarBotton.dart';
import './NavigationBar/NavigationBar.dart';

void main() => runApp(Index());

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 主题颜色
      theme: ThemeData(primaryColor: Colors.blue),
      // 首页组件入口
      home: Home(),
      // 路由表注册
      routes: {
        'Home': (BuildContext context) => Home(),
        // 顶栏
        'MyAppBar': (BuildContext context) => MyAppBar(),
        'MyAppBarBotton': (BuildContext context) => MyAppBarBotton(),
        // 底栏
        'MyStatefulWidget': (BuildContext context) => MyStatefulWidget(), 
      },
      // 默认第一次渲染的路由页面
      // initialRoute: 'home',
    );
  }
}

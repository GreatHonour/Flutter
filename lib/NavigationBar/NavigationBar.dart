import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // 对应导航的页面， 以后要做都的引入页面模块
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Email',
      style: optionStyle,
    ),
  ];

  void _onItemTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('底部导航栏'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 定义在底部导航栏的数量和外观
        items: const <BottomNavigationBarItem>[
          // 没一个按钮
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text('Email'),
          ),
        ],
        //设置显示的模式
        type: BottomNavigationBarType.fixed,
        // 当前点击的索引
        currentIndex: _selectedIndex,
        // 选中的颜色
        selectedItemColor: Colors.amber[800],
        // 未选中的颜色
        unselectedItemColor: Colors.grey,
        // 点击事件
        onTap: _onItemTab,
      ),
    );
  }
}

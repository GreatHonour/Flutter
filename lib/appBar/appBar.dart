import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部导航栏
      appBar: AppBar(
        // 标题
        title: Text("My App Bar"),
        // 图标，可以多个，所以必须是数组形式
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.list),
            // 图标事件
            onPressed: () {
              print('MyAppBarBotton');
              Navigator.of(context).popAndPushNamed('MyAppBarBotton');
            },
          ),
          new IconButton(
            icon: Icon(Icons.directions_bike),
            // 图标事件
            onPressed: () {
              print('directions_bike');
            },
          ),
        ],
      ),
      // 中间的内容
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Body', style: TextStyle(fontSize: 30))],
        ),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.red,
        ),
      ),
      // 圆形按钮，一般显示在屏幕的右下角
      floatingActionButton: FloatingActionButton(
        // 图标
        child: Icon(Icons.add),
        onPressed: () {
          print('点击按钮的回调函数');

          // 底部弹窗,内容可以自定义
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return new Container(
                height: 200.0,
                child: Text('底部弹窗,内容可以自定义'),
              );
            },
          ).then((val) {
            print(val);
          });
        },
        // 类似提示，长按提示文字
        tooltip: '类似提示，长按提示文字',
      ),
      // 圆形按钮在底部导航栏居中显示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 当设备的键盘出现时，Scaffold的主体调整大小以便为键盘腾出空间。要防止调整大小resizeToAvoidBottomInset设置为false
      //resizeToAvoidBottomInset: false,
      // 中间内容的背景颜色
      backgroundColor: Colors.green,
      // 底部弹窗，永久存在
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Text('bottomSheet'),
          );
        },
      ),
    );
  }
}

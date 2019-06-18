import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 
    appBar顶部导航栏
    body中间的内容
    bottomNavigationBar底部导航栏
    floatingActionButton圆形按钮，一般显示在屏幕的右下角
    floatingActionButtonLocation圆形按钮在底部导航栏居中显示
    resizeToAvoidBottomInset当设备的键盘出现时，Scaffold的主体调整大小以便为键盘腾出空间。要防止调整大小resizeToAvoidBottomInset设置为false
    backgroundColor中间内容的背景颜色
    bottomSheet底部弹窗，永久存在
     */
    // 返回每个隐藏的菜单项
  Widget _selectView(IconData icon, String text, String id) {
      return new PopupMenuItem<String>(
          value: id,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Icon(icon, color: Colors.blue),
              new Text(text),
            ],
          ));
    }

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
          // 隐藏的菜单
          new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  _selectView(Icons.message, '发起群聊', 'A'),
                  _selectView(Icons.group_add, '添加服务', 'B'),
                  _selectView(Icons.cast_connected, '扫一扫码', 'C'),
                ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case 'A':
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
            // 默认选中的
            initialValue: 'B',
          ),

        ],
        // 图标的颜色
        // actionsIconTheme: IconThemeData(color: Colors.red),
        // 是否隐藏顶部的返回键（图标）
        automaticallyImplyLeading: true,
        // 顶栏的背景颜色
        backgroundColor: Colors.blue,
        brightness: Brightness.light,
        // 设置图标的颜色，透明度，大小，通常和backgroundColor | brightness 一起使用
        // 如果设置了actionsIconTheme， 那么iconTheme的颜色不生效
        iconTheme: IconThemeData(color: Colors.white, opacity: 1, size: 40),
        // 标题是否居中
        centerTitle: true,

        // 在标题前面设置小组件（如按钮之类的），会覆盖掉原来的图标
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                print('data');
              },
            );
          },
        ),
        // 顶栏相对整个盒子的Z坐标
        // elevation: 0,
       
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
      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: () {
            print('button');
          },
          child: Text(
            '按钮',
            style:
                TextStyle(decoration: TextDecoration.none, color: Colors.white),
          ),
        )
      ],
    );
  }
}

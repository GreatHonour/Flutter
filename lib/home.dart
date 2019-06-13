import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app的顶栏
      appBar: AppBar(
        // 标题和样式
        title: Text(
          'Home 页面',
          textAlign: TextAlign.center,
        ),
      ),
      // app 的 内容
      body: Center(
        // Row 是水平方向
        // Column 是垂直方向
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('这是Home页面'),
            // 跳到新的页面 - 路由
            FlatButton(
              child: Text("MyAppBar"),
              textColor: Colors.red,
              onPressed: () {
                // 同过名字跳转到信页面
                Navigator.of(context).pushNamed("MyAppBar");
              },
            ),
            FlatButton(
              child: Text("MyStatefulWidget"),
              textColor: Colors.green,
              onPressed: () {
                // 同过名字跳转到信页面
                Navigator.of(context).pushNamed("MyStatefulWidget");
              },
            ),
          ],
        ),
      ),
    );
  }
}

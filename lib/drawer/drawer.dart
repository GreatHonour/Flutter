
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
      // 名字和邮箱
      accountName: Text('header'),
      accountEmail: Text('222@QQ.com'),
      // 主touxiang
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/bg.png'),
        radius: 50,
      ),
      // 三个头像得
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/bg.png'),
          radius: 50,
        ),

        // 有点击事件的
        new GestureDetector(
          //手势探测器，可以识别各种手势，这里只用到了onTap
          onTap: () => print('other user'), //暂且先打印一下信息吧，以后再添加跳转页面的逻辑
          child: new CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://upload.jianshu.io/users/upload_avatars/10878817/240ab127-e41b-496b-80d6-fc6c0c99f291?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
          ),
        ),
      ],

      // 用一个BoxDecoration装饰器提供背景图片
      decoration: new BoxDecoration(
        //用一个BoxDecoration装饰器提供背景图片
        image: new DecorationImage(
          fit: BoxFit.fill,
          // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
          //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
          image: new ExactAssetImage('assets/images/blue.jpg'),
        ),
      ),
      // 三角符号的
      onDetailsPressed: () {
        print('333');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 没有设置AppBar的leading属性，则当使用Drawer的时候会自动显示一个IconButton来告诉用户有侧边栏（在 Android 上通常是显示为三个横的图标
      appBar: AppBar(
        title: Text('侧边栏'),
      ),
      body: Center(
        child: Text('drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(),
            ListTile(
              title: Text('directions_bus 1'),
              leading: CircleAvatar(
                child: Icon(Icons.directions_bus),
              ),
              onTap: () {
                print(context);
                Navigator.pop(context);
              },
            ),
            // 分割线
            new Divider(),
            ListTile(
              title: Text('directions_car 2'),
              leading: CircleAvatar(
                child: Icon(Icons.directions_car),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('directions_railway 3'),
              leading: CircleAvatar(
                child: Icon(Icons.directions_railway),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // 弹窗
            // AboutDialog(
            //   applicationIcon: Icon(Icons.directions_bike),
            //   applicationName: 'dialog',
            //   children: <Widget>[Text('你好')],
            // ),
            // 点击出现得弹窗
            AboutListTile(
              icon: new CircleAvatar(child: new Text("Ab")),
              child: new Text("About"),
              applicationName: "Test",
              applicationVersion: "1.0",
              applicationIcon: new Image.asset(
                "assets/images/bg.png",
                width: 64.0,
                height: 64.0,
              ),
              applicationLegalese: "applicationLegalese",
              aboutBoxChildren: <Widget>[
                new Text("BoxChildren"),
                new Text("box child 2")
              ],
            ),
            new ListTile(
              //退出按钮
              title: new Text('Close'),
              leading: CircleAvatar(
                child: Icon(Icons.directions_bus),
              ),
              trailing: new Icon(Icons.cancel),
              // 路由跳出
              onTap: () => Navigator.of(context).pop(), //点击后收起侧边栏
            ),
          ],
        ),
      ),
    );
  }
}

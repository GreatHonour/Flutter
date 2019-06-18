import 'package:flutter/material.dart';
import './home.dart';
import './image/images.dart';
import './appBar/appBar.dart';
import './drawer/drawer.dart';
import './Container/Container.dart';
import './appBar/appBarBotton.dart';
import './NavigationBar/NavigationBar.dart';
import './target/index.dart';
import './target/dragTarget.dart';

void main() => runApp(Index());

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 主题颜色
      theme: ThemeData(primaryColor: Colors.blue),
      // 首页组件入口
      home: Home(),
      // 路由表注册 key / value
      routes: {
        'Home': (BuildContext context) => Home(),
        // 顶栏
        'MyAppBar': (BuildContext context) => MyAppBar(),
        'MyAppBarBotton': (BuildContext context) => MyAppBarBotton(),
        // 底栏
        'MyStatefulWidget': (BuildContext context) => MyStatefulWidget(),
        // 侧边栏
        'DrawerWidget': (BuildContext context) => DrawerWidget(),
        // 内容
        'MyContainer': (BuildContext context) => MyContainer(),
        // 图片组件
        'SetImage': (BuildContext context) => SetImage(),
        // 事件
        'EventIndex': (BuildContext context) => EventIndex(),
        'DragList': (BuildContext context) => DragList()
      },
      // 默认第一次渲染的路由页面
      // initialRoute: 'home',
      // 当路由跳转的时候，没有找到对应的路劲，会默认跳回设置的页面，相当于重定向
      onGenerateRoute: (setting) {
        //setting.isInitialRoute; bool类型 是否初始路由
        //setting.name; 要跳转的路由名key
        return new PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              //这里为返回的Widget
              return Home();
            },
            opaque: false,
            //跳转动画
            transitionDuration: new Duration(milliseconds: 200),
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new ScaleTransition(
                  scale: new Tween<double>(begin: 0.5, end: 1.0)
                      .animate(animation),
                  child: child,
                ),
              );
            });
      },
      // 当前区域，如果为null则使用系统区域,一般用于语言切换
      locale: Locale('zh', 'cn'),
      // 当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
      localeResolutionCallback: (local, support) {
        if (support.contains(support)) {
          print(support);
          return local;
        }
        // 这行会报错
        // return const Locale('zh', 'cn');
      },
      // 当为true时应用程序顶部覆盖一层GPU和UI曲线图，可即时查看当前流畅度情况
      showPerformanceOverlay: false,
      // 当为true时，打开Widget边框，类似Android开发者模式中显示布局边界
      showSemanticsDebugger: false,
      // debug模式下显示网格
      debugShowMaterialGrid: false,
      // 当为true时，打开光栅缓存图像的棋盘格
      checkerboardRasterCacheImages: false,
    );
  }
}

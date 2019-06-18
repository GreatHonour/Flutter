import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          /* 
        margin          //  通过EdgeInsets设置盒子的外边距
                            EdgeInsets.all 设置四个外边距
                            EdgeInsets.only( top: 0, bottom: 0, left: 0, right: 0, ) 设置上下左右的外边距 
                            EdgeInsets.fromLTRB(10, 20, 50, 40), 设置左上右下的外边距 int类型
        paddding        //  和margin一样
        color           //  盒子的背景颜色，如果decoration中设置了颜色，那么就不能设置color，否则会报错
        width | height  //  盒子的宽高
        alignment       //  还需要实际检验，控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式
        constraints     //  BoxConstraints.expand 来设置child上的额外约束条件
        decoration      //  通过BoxDecoration 来设置边框、圆角、阴影、形状、渐变、背景图像
                            color           //  背景颜色
                            image           //  背景图片，通过DecorationImage设置图片
                            border          //  边框
                            borderRadius    //  圆角度,分别四个角，左右两个角， 四个角
                                                BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(8),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(3))
                                                BorderRadius.horizontal( left: Radius.circular(4), right: Radius.circular(8))
                                                BorderRadius.circular(8) === BorderRadius.all(Radius.circular(4))
                            
                            boxShadow       //  阴影, 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
                            gradient        //  (线性渐变，环形渐变， 扫描渐变)
                            image           //   通过DecorationImage来设置背景图片，参数跟image一样
        transform       //  动画
*/
          Container(
              // 外边距
              margin: EdgeInsets.all(10),
              // 内边距
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              // 整体的背景颜色， 如果decoration中设置了颜色，那么就不能设置color，否则会报错
              // color: Colors.blue,
              // 控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式
              alignment: Alignment.center,
              /*  width: 600,
            height: 400, */

              // 添加到child上额外的约束条件
              constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 +
                      200),
              // 设置边框、圆角、阴影、形状、渐变、背景图像
              decoration: BoxDecoration(
                // 边框
                border: Border.all(width: .5, color: Colors.red),
                // 背景颜色
                color: Colors.blue,
                // 边框的圆角
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(3)),
                // BorderRadius.horizontal( left: Radius.circular(4), right: Radius.circular(8)),
                // BorderRadius.circular(8),
                // BorderRadius.all(Radius.circular(4)),
                // boxShadow: [
                //   // 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
                //   BoxShadow(
                //       color: Color(0x99FFFF00),
                //       offset: Offset(5.0, 5.0),
                //       blurRadius: 10.0,
                //       spreadRadius: 2.0),
                //   BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)),
                //   BoxShadow(color: Color(0xFF0000FF))
                // ],
                // 渐变色，背景色
                gradient: LinearGradient(colors: [
                  Color(0xFFFFFF00),
                  Color(0xFF00FF00),
                  Color(0xFF00FFFF)
                ], begin: FractionalOffset(1, 0), end: FractionalOffset(0, 1)),
                // 扫描类型的渐变色
                // SweepGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)], startAngle: 0.0, endAngle: 1*3.14),
                // 环形渐变
                // RadialGradient(colors: [
                //   Color(0xFFFFFF00),
                //   Color(0xFF00FF00),
                //   Color(0xFF00FFFF)
                // ], radius: 1, tileMode: TileMode.mirror),
                // 背景图
                image: DecorationImage(
                    image: AssetImage('assets/images/blue.jpg'),
                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                    repeat: ImageRepeat.noRepeat),
              ),
              // 动画
              transform: Matrix4.rotationZ(0.3),
              //  宽高
              // width: 50,
              // height: 50,
              child: Text(
                '我是String',
                style: TextStyle(decoration: TextDecoration.none),
              )),
          // Container(
          //   width: 80,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     // 边框
          //     border: Border.all(width: 1, color: Colors.blue),
          //     // 背景颜色
          //     color: Colors.blue,
          //     // 边框的圆角
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //   ),
          //   alignment: Alignment.center,
          //   child:
          //       Text('按钮', style: TextStyle(fontSize: 16, color: Colors.black)),
          // ),
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: Container(
          //         margin: const EdgeInsets.only(top: 20),
          //         color: Colors.red,
          //         padding: EdgeInsets.all(5.0),
          //       ),
          //       flex: 1,
          //     ),
          //     Expanded(
          //       child: Container(
          //         margin: const EdgeInsets.only(top: 20),
          //         color: Colors.yellow,
          //         padding: EdgeInsets.all(5.0),
          //       ),
          //       flex: 2,
          //     ),
          //     Expanded(
          //       child: Container(
          //         margin: const EdgeInsets.only(top: 20),
          //         color: Colors.blue,
          //         padding: EdgeInsets.all(5.0),
          //       ),
          //       flex: 1,
          //     ),
          //   ],
          // ),
          // Row(
          //   // flex : justify-content
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   // block || inline
          //   // mainAxisSize: MainAxisSize.min,
          //   // text-algin : left || right
          //   // textDirection: TextDirection.rtl,

          //   children: <Widget>[
          //     Text('one'),
          //     Text('one'),
          //     Text('one'),
          //   ],
          // ),
          // Column(
          //   children: <Widget>[
          //     Text('one'),
          //     Text('one'),
          //     Text('one'),
          //     Text('one'),
          //     Text('one'),
          //   ],
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
// 加载json 文件，异步
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
// import 'package:transparent_image/transparent_image.dart';

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
          /* 
            mainAxisAlignment     // 通过MainAxisAlignment设置盒子内容的垂直位置(Y轴)， start：垂直居上； center：垂直居中; end：垂直居下; spaceAround: 上下间距等分； spaceBetween：两边靠边，中间等分; spaceEvenly：所有间距等分
            crossAxisAlignment    // 通过CrossAxisAlignment设置盒子内容的水平位置(X轴)， start：水平居左； center：水平居中; end：水平居下; stretch： 平铺整屏,拉伸子child; baseline，这个要和textBaseline一起使用
            mainAxisSize          //  MainAxisSize设置 max：根据传入的布局约束条件，最大化主轴方向的可用空间；min：与max相反，是最小化主轴方向的可用空间；
            textDirection         // 最后两个属性似乎在Column没啥效果
            textBaseline
            verticalDirection     //  通过VerticalDirection设置child的位置： down:居上， up:居下
     */
          // 注意，一个row，代表的是每一行。不具备换行的功能，所有，需要换行，那么久不能row
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            // 更改child 的位置，
            // verticalDirection: VerticalDirection.down,
            children: <Widget>[
              /* 
                  inherit: true,     // 是否继承示, 默认为true
                  color,             // 颜色 
                  fontSize,          // int - 字号
                  fontWeight,        // 字重，加粗也用这个字段  FontWeight.w700
                  fontStyle,         // FontStyle.normal  FontStyle.italic斜体
                  letterSpacing,     // int- 字符间距  就是单个字母或者汉字之间的间隔，可以是负数
                  wordSpacing,       // int - 字间距 句字之间的间距
                  textBaseline,      // 通过TextBaseline来设置基线，两个值，字面意思是一个用来排字母的，一人用来排表意字的（类似中文）
                  height,            // init - 当用来Text控件上时，行高（会乘以fontSize,所以不以设置过大）
                  decoration,        // 通过TextDecoration来设置添加上划线，下划线，删除线 
                  decorationColor,   // 通过decorationColor来设置下划线的颜色
                  decorationStyle,   // 通过TextDecorationStyle来设置实线，虚线，两条线，点, 波浪线等
                  fontFamily,        // string- 字体
               */

              Text(
                '添加图片',
                // decorationColor: Colors.red, decorationStyle: TextDecorationStyle.dashed 文字下面两条下划线， 前面是颜色， 后面是线条的类型
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28,
                    fontFamily: "宋体",
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                    wordSpacing: 2,
                    textBaseline: TextBaseline.alphabetic,
                    // 去掉下划线
                    decoration: TextDecoration.none,
                    height: 1),
              ),

              // Image.asset('assets/images/bg.png'),
              /* 
                image         // 通过AssetImage()添加图片路径
                semanticLabel // 语义标签
                width         // 用来指定显示图片区域的宽
                height        // 用来指定显示图片区域的高
                color         // 图片的背景颜色
                alignment     // 通过Alignment来控制图片显示的位置，居中，左，右,
                repeat        // 通过ImageRepeat设置图片重复显示（repeat-x水平重复，repeat-y垂直重复，repeat两个方向都重复，no-repeat默认情况不重复）
                centerSlice,  // 设置图片内部拉伸，相当于在图片内部设置了一个.9图，但是需要注意的是，要在显示图片的大小大于原图的情况下才可以使用这个属性，要不然会报错
                matchTextDirection  // 这个需要配合Directionality进行使用,可以让图片里面的内容实现左右转换, 默认为false
                gaplessPlayback     // 当图片发生改变之后，重新加载图片过程中的样式（true:原图片保留，默认为false）
                colorBlendMode      // colorBlendMode和color 这两个属性需要配合使用，就是颜色和图片混合，就类似于Android中的Xfermode
                fit:                //  BoxFit.contain全图居中显示但不充满，显示原比例
                                        BoxFit.cover图片可能拉伸，也可能裁剪，但是充满容器
                                        BoxFit.fill全图显示且填充满，图片可能会拉伸
                                        BoxFit.fitHeight图片可能拉伸，可能裁剪，高度充满
                                        BoxFit.fitWidth图片可能拉伸，可能裁剪，宽度充满
                                        BoxFit.scaleDown效果和contain差不多， 但是只能缩小图片，不能放大图片

               */
              // new Image(
              //   width: 160,
              //   height: 130,
              //   // color: Colors.red,
              //   fit: BoxFit.fill,
              //   repeat: ImageRepeat.noRepeat,
              //   semanticLabel: '2349834',
              //   image: new AssetImage('assets/images/bg.png'),
              // ),

              /* 
                strutStyle      // 暂时不太明白
                style           // 通过TextStyle来设置样式       
                textDirection   // 通过TextDirection设置文字居左还是居右ltr || rtl
                locale          // 用于选择区域特定字形的语言环境
                softWrap        // 文字是否换行，默认换行-true， false为不换行
                maxLines        // int - 设置字体显示几行，不设置默认是自动换行
                semanticsLabel  // string - 图像的语义描述，用于向Andoid上的TalkBack和iOS上的VoiceOver提供图像描述
                overflow        // 通过TextOverflow来设置超出隐藏还是省略号，配合maxLines使用
                                    TextOverflow.clip剪切溢出的文本以修复其容器。
                                    TextOverflow.ellipsis使用省略号表示文本已溢出。
                                    TextOverflow.fade将溢出的文本淡化为透明。
                textAlign       // 通过TextAlign设置文字居中，左，右
                                    TextAlign.center将文本对齐容器的中心。
                                    TextAlign.end对齐容器后缘上的文本。
                                    TextAlign.justify拉伸以结束的文本行以填充容器的宽度。即使用了decorationStyle才起效
                                    TextAlign.left对齐容器左边缘的文本。
                                    TextAlign.right对齐容器右边缘的文本。
                                    TextAlign.start对齐容器前缘上的文本。
              */
              // Text(
              //   'AA',
              //   // textDirection: TextDirection.rtl,
              //   style: TextStyle(decoration: TextDecoration.none, fontSize: 20),
              // ),
              // 添加 Expanded || Flexible可以实现自动换行，
              // Expanded(
              //   child: Text(
              //     '文字设置文字设文字设文字设置文字设置文字设文字设文字设置',
              //     textAlign: TextAlign.left,
              //     style:
              //         TextStyle(decoration: TextDecoration.none, fontSize: 14),
              //   ),
              // ),
              // Text(
              //   '文字设置文字设文字设文字设置',
              //   textAlign: TextAlign.left,
              //   style: TextStyle(decoration: TextDecoration.none, fontSize: 14),
              // ),
              // Text.rich(TextSpan(
              //     text: '行内元素： ',
              //     style:
              //         TextStyle(decoration: TextDecoration.none, fontSize: 14),
              //     children: <TextSpan>[
              //       TextSpan(
              //           text: '这个是textspan1',
              //           style: TextStyle(color: Colors.blue)),
              //       TextSpan(
              //           text: ' | ',
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 20,
              //           )),
              //       TextSpan(text: '这个是textspan3'),
              //     ]))

              // 图标
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // 创建一个icon, 颜色为粉色， 大小为60*60的
                  Icon(
                    Icons.add,
                    color: Colors.pink,
                    size: 60,
                    semanticLabel: '图标语义',
                    textDirection: TextDirection.ltr,
                  ),

                  /* 
                    onPressed:    点击按钮的回调函数,
                    onHighlightChanged: 水波纹高亮变化回调,按下返回true,抬起返回false,
                    textTheme:      按钮的主题,
                    textColor:      按钮字体的颜色和按钮的点击时触发的颜色,
                    disabledTextColor: 按钮禁用时候文字的颜色,
                    color:          按钮的背景颜色,
                    disabledColor:  按钮的禁用颜色,
                    highlightColor: 点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色,
                    splashColor: 水波纹的颜色,
                    colorBrightness: 按钮主题高亮,
                    elevation: 按钮下面的阴影,
                    hihglightElevation: 高亮时候的阴影,
                    disabledElevation: 按下的时候的阴影,
                    padding: 内边距padding,
                    shape: 设置形状,
                    clipBehavior: clipBehavior,
                    materialTapTargetSize: 通过MaterialTapTargetSize设置按钮的撒谎给你下位置，（shrinkWrap， padded),
                    animationDuration: 通过Duration设置动画周期，动画时间,
                  
                   */
                  RaisedButton(
                    onPressed: () {
                      print('button');
                    },
                    textTheme: ButtonTextTheme.accent,
                    textColor: Colors.red,
                    color: Colors.blue,
                    child: Text(
                      '按钮',
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                    onHighlightChanged: (data) {
                      print(data);
                    },
                    animationDuration: Duration.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),

                  RaisedButton.icon(
                    onPressed: () {
                      print('button');
                    },
                    icon: Icon(Icons.add),
                    label: Text('按钮'),
                  )
                ],
              )
            ],
          ),
        ),
        decoration: new BoxDecoration(color: Colors.white));
  }
}

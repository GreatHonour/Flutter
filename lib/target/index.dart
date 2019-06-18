import 'package:flutter/material.dart';

class EventIndex extends StatefulWidget {
  @override
  _GestureDetectorState createState() => new _GestureDetectorState();
}

class _GestureDetectorState extends State<EventIndex> {
  double _top = 0.0; // 距顶部的偏移
  double _left = 0.0; // 距左边的偏移
  double _verTop = 30;
  double _horLeft = 0.0;
  double _widht = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 任意拖动
        Positioned(
            top: _top,
            left: _left,
            // 通过Listener监听原始指针事件,避免多种事件冲突，某些事件无法触发
            child: Listener(
              onPointerDown: (PointerDownEvent details) {
                print("down");
              },
              onPointerUp: (PointerUpEvent details) {
                //会触发
                print("up");
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text(
                    'A',
                    style: TextStyle(
                        decoration: TextDecoration.none, fontSize: 24),
                  ),
                ),
                //手指按下时会触发此回调
                onPanDown: (DragDownDetails e) {
                  print("用户手指按下：${e.globalPosition}");
                },
                // 手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails e) {
                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  // 打印滑动结束时在x、y轴上的速度
                  print('DragEndDetails----$_left -- $_top');
                },
              ),
            )),

        // 单一垂直 | 单一水平 滑动
        Positioned(
          top: _verTop,
          left: _horLeft,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text(
                'B',
                style: TextStyle(decoration: TextDecoration.none, fontSize: 24),
              ),
            ),

            // 单一垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _verTop += e.delta.dy;
              });
            },

            // 单一水平方向移动
            onHorizontalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                _horLeft += e.delta.dx;
              });
            },
          ),
        ),
        // 缩放
        Center(
          child: GestureDetector(
            child: Image.asset(
              'assets/images/bg.png',
              width: _widht,
            ),
            onScaleUpdate: (ScaleUpdateDetails e) {
              print('${e.scale}');
            },
          ),
        )
      ],
    );
  }
}
//   final TextStyle _textStyle =
//       TextStyle(decoration: TextDecoration.none, fontSize: 18);
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             // LongPressDraggable(
//             //   // child 和 feedback 必须同时存在，不然报错
//             //   child: Text('按钮', style: _textStyle),
//             //   // 被拖拽的内容
//             //   feedback: Text('被拖拽的内容', style: _textStyle),
//             //   // 长按拖拽，拖拽开始
//             //   onDragStarted: () {
//             //     print('onDragStarted');
//             //   },
//             // ),
//             // GestureDetector(
//             //   // 点击
//             //   onTap: () => debugPrint("onTap"),
//             //   // 双击
//             //   onDoubleTap: () => debugPrint("onDoubleTap"),
//             //   // 先前触发onTapDown的指针不会导致点击
//             //   onTapCancel: () => debugPrint("onTapCancel"),
//             //   // 可能导致点击的指针已在特定位置与屏幕联系
//             //   onTapDown: (_) => debugPrint("onTapDown"),
//             //   // 将触发敲击的指针已停止在特定位置接触屏幕
//             //   onTapUp: (_) => debugPrint("onTapUp"),

//             //   // 指针不再与屏幕接触
//             //   onForcePressEnd: (_) => debugPrint("onForcePressEnd"),
//             //   // 指针与屏幕接触并以最大力按下。力量至少是 ForcePressGestureRecognizer.peakPressure
//             //   onForcePressPeak: (_) => debugPrint("onForcePressPeak"),
//             //   // 指针与屏幕接触，并用足够的力按压以启动压力。力量至少是 ForcePressGestureRecognizer.startPressure
//             //   onForcePressStart: (_) => debugPrint("onForcePressStart"),
//             //   // 指针与屏幕接触，之前已经通过了 ForcePressGestureRecognizer.startPressure，并且要么在屏幕的平面上移动，要么用不同的力按压屏幕，要么同时按两个屏幕
//             //   onForcePressUpdate: (_) => debugPrint("onForcePressUpdate"),

//             //   // 水平移动
//             //   // 手指已接触屏幕，可能开始水平移动
//             //   onHorizontalDragDown: (_) => debugPrint("onHorizontalDragDown"),
//             //   // 手指已接触屏幕并开始水平移动
//             //   onHorizontalDragStart: (_) => debugPrint("onHorizontalDragStart"),
//             //   // 手指屏幕接触并水平移动的指针在水平方向上移动
//             //   onHorizontalDragUpdate: (_) =>debugPrint("onHorizontalDragUpdate"),
//             //   // 手指不在移动，离开屏幕
//             //   onHorizontalDragEnd: (_) => debugPrint("onHorizontalDragEnd"),
//             //   // 手下离开屏幕
//             //   onHorizontalDragCancel: () => debugPrint("onHorizontalDragCancel"),

//             //   // 手指长按 按下
//             //   onLongPress: () => debugPrint("onLongPress"),
//             //   // 手指长按开始回调手势位置
//             //   onLongPressStart: (_) => debugPrint("onLongPressStart"),
//             //   // 手指长按后，指针已被拖动
//             //   onLongPressMoveUpdate: (_) => debugPrint("onLongPressMoveUpdate"),
//             //   // 手指触发长按的指针已停止接触屏幕
//             //   onLongPressUp: () => debugPrint("onLongPressUp"),
//             //   // 手指长按的指针已停止接触屏幕
//             //   onLongPressEnd: (_) => debugPrint("onLongPressEnd"),

//             //   // 手指滑动
//             //   // 先前触发onPanDown的指针未完成
//             //   onPanCancel: () => debugPrint("onPanCancel"),
//             //   // 指针已接触屏幕并可能开始移动
//             //   onPanDown: (_) => debugPrint("onPanDown"),
//             //   // 指针已经接触屏幕并开始移动。
//             //   onPanStart: (_) => debugPrint("onPanStart"),
//             //   // 与屏幕接触并移动的指针再次移动。
//             //   onPanUpdate: (_) => debugPrint("onPanUpdate"),
//             //   // 指针不再与屏幕接触。
//             //   onPanEnd: (_) => debugPrint("onPanEnd"),

//             //   // 手指缩放
//             //   // 与屏幕接触的指针已建立焦点，初始比例为1.0
//             //   onScaleStart: (_) => debugPrint("onScaleStart"),
//             //   // 与屏幕接触的指针表示新的焦点和/或比例
//             //   onScaleUpdate: (_) => debugPrint("onScaleUpdate"),
//             //   // 指针不再与屏幕接触
//             //   onScaleEnd: (_) => debugPrint("onScaleEnd"),

//             //   // 单一方向垂直移动
//             //   // 指针已接触屏幕，可能会开始垂直移动。
//             //   onVerticalDragDown: (_) => debugPrint("onVerticalDragDown"),
//             //   // 先前触发onVerticalDragDown的指针未完成
//             //   onVerticalDragCancel: () => debugPrint("onVerticalDragCancel"),
//             //   // 指针已接触屏幕并已开始垂直移动
//             //   onVerticalDragStart: (_) => debugPrint("onVerticalDragStart"),
//             //   // 手指在屏幕接触并垂直移动的指针在垂直方向上移动
//             //   onVerticalDragUpdate: (_) => debugPrint("onVerticalDragUpdate"),
//             //   // 之前与屏幕接触并垂直移动的指针不再与屏幕接触，并且当它停止接触屏幕时以特定速度移动
//             //   onVerticalDragEnd: (_) => debugPrint("onVerticalDragEnd"),

//             //   child: Container(
//             //     color: Colors.yellow,
//             //     child: Text('TURN LIGHTS ON', style: _textStyle),
//             //   ),
//             // )

//             // 拖拽

//           ],
//         ),
//       ],
//     );
//   }
// }

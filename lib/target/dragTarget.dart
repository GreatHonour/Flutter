import 'package:flutter/material.dart';

class DragList extends StatefulWidget {
  @override
  _DragListState createState() => new _DragListState();
}

class _DragListState extends State<DragList> {
  // String _target = 'Traget';
  @override
  Widget build(BuildContext context) {
          /* 
        AlignmentDirectional.topStart     垂直靠顶部水平居左
        AlignmentDirectional.topCenter    垂直靠顶部水平居中
        AlignmentDirectional.topEnd       垂直靠顶部水平居右

        AlignmentDirectional.centerStart  垂直居中水平居左
        AlignmentDirectional.center       垂直和水平居中
        AlignmentDirectional.centerEnd    垂直居中水平居右

        AlignmentDirectional.bottomStart  垂直靠底部水平居左
        AlignmentDirectional.bottomCenter 垂直靠底部水平居中
        AlignmentDirectional.bottomEnd    垂直靠底部水平居右

        也可以像我一样指定具体的偏移量，它是以整个组件的中心为坐标原点，x、y 偏移量取值范围为 [-1,1]，
        如果 x 的偏移量大于 0表示向右偏移，小于 0 则向左偏移；如果 y 轴的偏移量大于 0 则向下偏移，小于 0 则向上偏移
        AlignmentDirectional(1, 0)
       */
      // alignment: AlignmentDirectional(1, 0),
      // 文档流靠左还是右
      //textDirection: TextDirection.rtl,
      // fit: StackFit.passthrough,
    return Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        CircleAvatar(
          child: Text(
            'A',
            style: TextStyle(decoration: TextDecoration.none, fontSize: 24),
          ),
        ),
        Positioned(
            child: CircleAvatar(
              child: Text(
                'AB',
                style: TextStyle(decoration: TextDecoration.none, fontSize: 24),
              ),
            ),
            width: 80,
            height: 80,
            left: 120,
            top: 120),
        Positioned(
            child: CircleAvatar(
              child: Text(
                'AB',
                style: TextStyle(decoration: TextDecoration.none, fontSize: 24),
              ),
            ),
            width: 80,
            height: 80,
            left: 120,
            top: 320)
      ],
    );
  }
}

// 子级组件
import 'package:flutter/material.dart';

class ChildrenWidget extends StatelessWidget {
  ChildrenWidget({Key key, this.active: false, @required this.onChange})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  void _handleTap() {
    onChange(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
          child: Row(
            children: <Widget>[
              new Text(active ? '这是' : ''),
              new Text('设置文字'),
            ],
          ),
          decoration: new BoxDecoration(color: Colors.white)),
    );
  }
}

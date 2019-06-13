import 'package:flutter/material.dart';
/* 状态管理 */
// TabBoxA 管理自身的状态state（_active），并没有暴露给父级元素

class TabBoxA extends StatefulWidget {
  TabBoxA({Key key}) : super(key: key);

  @override
  // 创建state 状态管理
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TabBoxA> {
  bool _active = false;

// 设置点击事件
  void _handleTab() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTab,
      child: new Container(
        child: new Center(
          child: new Text(_active ? 'active' : 'no-actvie',
              style: new TextStyle(fontSize: 32.0, color: Colors.blue[300])),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.green[600]),
      ),
    );
  }
}

/* ************************ TabBoxB 父级*************************8 */
// TabBoxB 把自己的状态交给父级管理

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTabBoxChange(bool newActive) {
    setState(() {
      _active = newActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 把父级的 state 和 函数 传递给子级， 然后在通过子级调用父级的函数，把state状态，通过函数传递回来
    return new TabBoxB(active: _active, onChanged: _handleTabBoxChange);
  }
}

/* *************************TabBoxB**************************** */
class TabBoxB extends StatelessWidget {
  TabBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

/* ************************ TabBoxC ************************** */

// 父级
class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetStateC createState() => new _ParentWidgetStateC();
}

// 父级的状态
class _ParentWidgetStateC extends State<ParentWidgetC> {
  bool _active = false;
  void _handleTabChangeC(bool newState) {
    setState(() {
      _active = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 父级把状态传递给子级 props
    return new TabBoxC(active: _active, onChanged: _handleTabChangeC);
  }
}

// 子级
class TabBoxC extends StatefulWidget {
  // 子级接收props状态
  TabBoxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

// 子级创建自己的状态管理树
  @override
  _TapboxCState createState() => new _TapboxCState();
}

// 子级自己的状态
class _TapboxCState extends State<TabBoxC> {
  bool _highlight = false;

// 处理按下事件
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

// 处理抬起事件
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

// 取消事件
  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  // 点击事件
  void _handleTap() {
    // 调用父级的函数，返回状态
    //  widget === TabBoxC 这个组件
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTapCancel: _handleTapCancel, // 取消事件
      onTap: _handleTap, // 点击事件
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

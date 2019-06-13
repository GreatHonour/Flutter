import 'package:flutter/material.dart';

// 卡片
// 公用样式
final _itemLabelStyle = const TextStyle(
  color: Color.fromRGBO(100, 100, 100, 1),
  fontSize: 14.0,
);
final _itemValueStyle =
    const TextStyle(color: Color.fromRGBO(22, 22, 22, 1), fontSize: 16.0);

/* 
     new BoxDecoration(
              color: Color.fromRGBO(201, 201, 201, 1),
              border: new Border.all(width: 1.0, style: BorderStyle.solid),
            ),
     */

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('卡片列表', textAlign: TextAlign.center)),
      body: Container(
        // new EdgeInsets.only(left: 30.0, right: 0.0, top: 20.0, bottom: 20.0) const EdgeInsets.all(16.0),
        padding: new EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 0.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "蛇口人民医院",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20.0, height: 1.0),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '今日上网人数',
                  style: _itemLabelStyle,
                ),
                Text('100人', style: _itemValueStyle)
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '实时上网人数',
                  style: _itemLabelStyle,
                ),
                Text('100人', style: _itemValueStyle)
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '在线WIFI设备',
                  style: _itemLabelStyle,
                ),
                Text('100台', style: _itemValueStyle)
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '离线WIFI设备',
                  style: _itemLabelStyle,
                ),
                Text('100台', style: _itemValueStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}

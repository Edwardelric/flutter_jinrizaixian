import 'package:flutter/material.dart';

// https://book.flutterchina.club/chapter3/buttons.html

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List lists = [
      'JS',
      'Jquery',
      'Angular1.0',
      'React',
      'Vue',
      'Node',
      'Express',
      'Koa',
      'mySql',
      'mongodb',
      'ReactNative',
      'Flutter',
      'Docker'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索')
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10.0,                    // 横轴间距         
          runSpacing: 10.0,                 // 纵轴间距
          children: lists.map((item) {
            return _raiseButtonWt(item);
          }).toList(),
        ),
      )
    ); 
  }

  Widget _raiseButtonWt(String item) {
    return RaisedButton.icon(
      icon: Icon(Icons.search),
      onPressed: () {
        print('onpressed');
      },
      color: Colors.green,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      label: Text(
        '${item}',
        style: TextStyle(
          fontSize: 14,
        )
      )
    );
  }
}
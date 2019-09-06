import 'package:flutter/material.dart';

class WrapWt extends StatelessWidget {
  
  const WrapWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 10.0,                    // 横轴间距         
        runSpacing: 10.0,                 // 纵轴间距
        children: <Widget>[
          RaisedButton(
            onPressed: (){},
            child: Text('第一季')
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('第一季')
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('第一季')
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('第一季')
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('第一季')
          ),
        ],
      )
    );
  }
}
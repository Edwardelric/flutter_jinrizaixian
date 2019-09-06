import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackWt extends StatelessWidget {
  const StackWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: 400.0,
      // margin: EdgeInsets.all(60.0),
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child:  Container(
              child: Text('11'),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 370.0,
            child: Container(
              child: Text('11'),
            ),
          ),
          
          Container(
            child: Text('22'),
          ),
          Container(
            child: Text('33'),
          ),
        ],
      )
    );
  }
}

// stack  

// alignment 配置所有子元素的显示位置
// children
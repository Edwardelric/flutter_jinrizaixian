import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 200.0,
      margin: EdgeInsets.all(50.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.green,
          width: 10.0
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0)
        ),
      ),
      child: Text(
        '123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789',
        textAlign: TextAlign.right, // 对其位置,
        textDirection: TextDirection.ltr, // 换行后文字靠左还是靠右
        overflow: TextOverflow.ellipsis,  // 超出maxLine后，超出文字处理方式,
        maxLines: 2,              // 文字显示的最大行数 
        textScaleFactor: 2.0,
        style: TextStyle(
          color: Colors.green,
          fontSize: 20.0,
          decoration: TextDecoration.lineThrough,
          decorationColor: Colors.white,
          decorationStyle: TextDecorationStyle.double,
        )
      )
    );
  }
}
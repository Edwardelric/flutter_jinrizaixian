import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnRow extends StatelessWidget {
  const ColumnRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      // child: Column(
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: <Widget>[
      //         Text('aa'),
              
      //         Text('bb'),
              
      //       ],
      //     )
      //   ],
      // ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              width: 300.0,
              color: Colors.red,
              height: 180.0,
              padding: EdgeInsets.only(right: 10.0),
              child: Image.network(
                'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
                fit: BoxFit.cover
              )
            ),
          ),
        
          Expanded(
            flex: 1,
            child: Container(
              height: 180.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network('https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg', fit: BoxFit.cover),
                  Image.network('https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg', fit: BoxFit.cover)
                ],
              )
            )
          )
        ],
      )
    );
  }
}
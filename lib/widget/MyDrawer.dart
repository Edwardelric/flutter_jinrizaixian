import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/widget/SmartDrawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  _MyDrawerState createState() => _MyDrawerState();
}

// drawer讲解: https://www.jianshu.com/p/70e0324c0204

class _MyDrawerState extends State<MyDrawer> {
  final String imgUrl = 'lib/assets/imgs/timg.jpeg';
  final String xiUrl = 'lib/assets/imgs/xi.jpeg';
  final String teUrl = 'lib/assets/imgs/te.jpeg';
  final String jinUrl = 'lib/assets/imgs/jin.jpeg';
  @override
  Widget build(BuildContext context) {
    return SmartDrawer(
      widthPercent: 0.6,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: InkWell(
              onTap: () {
                print('currentAccountPicture');
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('$xiUrl'),
              ),
            ),
            otherAccountsPictures: <Widget>[
              InkWell(
                onTap: () {
                  print('otherAccountsPictures-1');
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('$teUrl'),
                ),
              ),
              InkWell(
                onTap: () {
                  print('otherAccountsPictures-2');
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('$jinUrl')
                ),
              ),
            ],
            accountName: Text('Edward'),
            accountEmail: Text('elric'),
          ),
          DrawTile(),
        ],
      )
    );
  }
}

class DrawTile extends StatefulWidget {
  DrawTile({Key key}) : super(key: key);

  _DrawTileState createState() => _DrawTileState();
}

class _DrawTileState extends State<DrawTile> {
  final List<Map> tile = [
    {
      'name': '首页',
      'iconName': Icons.home,
      'index': 0
    }, {
      'name': '历史记录',
      'iconName': Icons.history,
      'index': 1
    }, {
      'name': '下载管理',
      'iconName': Icons.cloud_download,
      'index': 2
    }, {
      'name': '收藏',
      'iconName': Icons.favorite,
      'index': 3
    }
  ];
  int currentIndex = 0;

  bool checkIndex(index) {
    return currentIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tile.map((item) {
        return InkWell(
          onTap: () {
            setState(() {
              currentIndex = item['index'];
              // Navigator.of(context).pop();
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: checkIndex(item['index']) ? Colors.green : Colors.white,
              border: Border(
                bottom: BorderSide(width: 2.0, color: Color.fromRGBO(243, 243, 243, 1))
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(item['iconName'],color: checkIndex(item['index']) ? Colors.white : Colors.grey),
                ),
                Text(
                  '${item['name']}', 
                  style: TextStyle(
                    color: checkIndex(item['index']) ? Colors.white : Colors.black87
                  )
                )
              ],
            )
          )
        );
      }).toList()
    );
  }
}
import 'package:flutter/material.dart';

class ListViewWt extends StatelessWidget {

  const ListViewWt({Key key}) : super(key: key);

  List<Widget> _getData() {
    List<Widget> list = new List();
    for (int i = 0; i < 10; i++) {
      list.add(
        ListTile(
          leading: ClipOval(
            child: Image.network(
              'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text('我是${i}列表')
        )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: _getData().length,
        itemBuilder: (BuildContext context, index) {
          return _getData()[index];
        },
      )
    );
  }
}
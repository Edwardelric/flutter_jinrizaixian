import 'package:flutter/material.dart';

class GridViewWt extends StatelessWidget {
  const GridViewWt({Key key}) : super(key: key);

  List<Widget> _getData() {
    List<Widget> list = new List();
    for (int i = 0; i < 10; i++) {
      list.add(
        Container(
          color: Colors.blue,
          child: ListTile(
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
        )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: GridView.count(
      //   childAspectRatio: 1,
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 20.0,
      //   mainAxisSpacing: 20.0,
      //   children: _getData(),
      // )
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            crossAxisCount: 3,
          ),
          itemCount: _getData().length,
          itemBuilder:(BuildContext context, index) {
            return _getData()[index];
          },
        )
      )
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(                 // 定义Material 布局
      title: 'flutter_share',
      home: Scaffold(                   // Material Design 布局结构的基本实现
        body: ImageWt()
      ), 
    );
  }
}

// Container widget
class ContainerWt extends StatelessWidget {
  const ContainerWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        // color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(width: 4.0, color: Colors.green),
          // borderRadius: BorderRadius.all(
          //   Radius.circular(100.0),
          // ),
        )
      )
    );
  }
}

// Container + Text widget
class ContainerText extends StatelessWidget {
  const ContainerText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 10.0, color: Colors.green),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Text(
          'EdwardEdwardEdwardEdwardEdwardEdward',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24.0,
          ),
        ),
      )
    );
  } 
}

// Image widget
class ImageWt extends StatelessWidget {
  const ImageWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        // color: Colors.red,
        decoration: BoxDecoration(
          border: Border.all(width: 4.0, color: Colors.green),
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
        child: Image.asset(
          'lib/assets/imgs/te.jpeg',
          fit: BoxFit.cover
        ),
        // child: ClipOval(
        //   child: Image.asset(
        //     'lib/assets/imgs/te.jpeg',
        //     fit: BoxFit.cover
        //   )
        // ),
        // child: CircleAvatar(
        //   backgroundImage: NetworkImage('https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg'),
        // )
      )
    );
  }
}

// ListView widget
class ListWt extends StatelessWidget {
  
  const ListWt({Key key}) : super(key: key);
  
  List<Widget> _getData() {
    List<Widget> ownListTile = [];
    for (int i = 0; i < 15; i++) {
      ownListTile.add(
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.blue),
            ),
          ),
          child: ListTile(
            leading: ClipOval(
              child: Image.network(
                'https://img.alicdn.com/tps/i4/TB1e.ipe4n1gK0jSZKPSutvUXXa.jpg_q90_.webp',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover
              ),
            ),
            title: Text('aa${i}'),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      );
    } 
    return ownListTile;
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: ListView(
        children: _getData()
      )
    );
  }
}

// ListView builder
class ListBuildWt extends StatelessWidget {
  const ListBuildWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext build, index) {
          if (index % 2 == 0) {
            return ListContainerWt(curIndex: 3333);  
          }
          return ListContainerWt(curIndex: index);
          // return CircleAvatar(
          //   child: Image.network('https://img.alicdn.com/tps/i4/TB1e.ipe4n1gK0jSZKPSutvUXXa.jpg_q90_.webp'),
          // );
        },
      ),
    );
  }
}

class ListContainerWt extends StatelessWidget {
  final int curIndex;
  const ListContainerWt({Key key, this.curIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2.0, color: Colors.blue),
        ),
      ),
      child: ListTile(
        // leading: ClipOval(
        //   child: Image.network(
        //     'https://img.alicdn.com/tps/i4/TB1e.ipe4n1gK0jSZKPSutvUXXa.jpg_q90_.webp',
        //     width: 80, 
        //     height: 80,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://img.alicdn.com/tps/i4/TB1e.ipe4n1gK0jSZKPSutvUXXa.jpg_q90_.webp'),
        ),
        title: Text('aa${curIndex}edward'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}

// Wrap Chip widget
class WrapChip extends StatelessWidget {
  const WrapChip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(100.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
                )
              ),
              label: Text('aa')
            ),
            Chip(
              label: Text('aa')
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
                )
              ),
              label: Text('aa')
            ),
            Chip(
              label: Text('aa')
            )
          ],
        ),
      
    );
  }
}
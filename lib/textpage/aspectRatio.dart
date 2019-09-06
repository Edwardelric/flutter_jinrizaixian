import 'package:flutter/material.dart';

class AspectRatioWt extends StatelessWidget {
  const AspectRatioWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
       
    //   child: AspectRatio(
    //     aspectRatio: 2.0/1.0,
    //     child: Container(
    //       color: Colors.green,
    //     )
    //   ),
    // );
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network(
                  'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
                  fit: BoxFit.cover
                ),
              ),
              ListTile(
                // leading: ClipOval(
                //   child: Image.network(
                //     'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
                //     width: 60.0,
                //     height: 60.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg')
                ),
                title: Text('aa', style: TextStyle(fontSize: 20.0)),
                subtitle: Text('bb'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('lib/assets/imgs/timg.jpeg')
              ),
            ],
          )
        )
      ],
    );
  }
}
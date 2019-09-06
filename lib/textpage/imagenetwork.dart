import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 300.0,
    //   height: 300.0,
    //   decoration: BoxDecoration(
    //     color: Colors.green
    //   ),
    //   child: Image.asset(
    //     'lib/assets/imgs/te.jpeg',
    //     alignment: Alignment.topCenter,
    //     color: Colors.yellow,
    //     colorBlendMode: BlendMode.darken,
    //     fit: BoxFit.contain,
    //   ),
    // );
    return ClipOverWt();
  }
}

class ClipOverWt extends StatelessWidget {
  const ClipOverWt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.yellow),
      ),
      child: ClipOval(
        child: Image.network(
          'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover
        ),
      )
    );
  }
}

class AvatorImage extends StatelessWidget {
  const AvatorImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(150),
        image: DecorationImage(
          image: NetworkImage('https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Text('aabbcc'),
    );
  }
}


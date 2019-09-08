import 'package:flutter/material.dart';

class TopNavWt extends StatelessWidget {
  final List<Map> topNavList;
  const TopNavWt({Key key, this.topNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (topNavList.length > 10) {
      topNavList.removeRange(10, topNavList.length);
    }
    return Container(
      height: 180.0,
      padding: EdgeInsets.all(10.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
        ),
        itemCount: topNavList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(index);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  topNavList[index]['image'],
                  width: 40.0,
                ),
                Text(
                  topNavList[index]['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavWt extends StatelessWidget {
  // final List<int> topNavList;
  // const TopNavWt({Key key, this.topNavList}) : super(key: key);
  final List topNavList = new List();
  TopNavWt() {
    topNavList.addAll([
      {
        'image': 'https://images.baixingliangfan.cn/firstCategoryPicture/20180408/20180408111959_2837.png',
        'txt': '易购'
      }, {
        'image': 'https://images.baixingliangfan.cn/firstCategoryPicture/20180408/20180408112010_4489.png',
        'txt': '超市'
      }, {
        'image': 'https://images.baixingliangfan.cn/firstCategoryPicture/20180408/20180408112053_8191.png',
        'txt':'国际'
      }, {
        'image': 'https://images.baixingliangfan.cn/firstCategoryPicture/20180408/20180408113102_1595.png',
        'txt': '聚划算'
      }, {
        'image': 'https://images.baixingliangfan.cn/firstCategoryPicture/20180408/20180408113048_1276.png',
        'txt': '分类'
      }, {
        'image': 'https://img.alicdn.com/bao/uploaded/i3/725677994/O1CN01alnMEY28vIhsHhZJQ_!!725677994.jpg_160x160q90.jpg',
        'txt': '进口'
      }, {
        'image': 'https://img.alicdn.com/bao/uploaded/i2/725677994/O1CN01hqHk7n28vIhYtR3XR_!!725677994.jpg_160x160q90.jpg',
        'txt': '材料'
      }, {
        'image': 'https://img.alicdn.com/bao/uploaded/i4/725677994/O1CN01lXf58428vIhnIpzmd_!!725677994.jpg_160x160q90.jpg',
        'txt': '洗护'
      }
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    // topNavList.add(1);
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minWidth: double.infinity,
        minHeight: ScreenUtil().setHeight(240),
      ),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: topNavList.sublist(0,5).map((item) {
                return _gridViewItem(context, item);
              }).toList(),
            ),
            Container(
              height: ScreenUtil().setHeight(20.0)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: topNavList.sublist(3).map((item) {
                return _gridViewItem(context, item);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: (){ print(item);},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['txt'])
        ],
      ),
    );
  }
}

// class TopNavWt extends StatefulWidget {
//   final List topNavList;
//   TopNavWt({Key key, this.topNavList}) : super(key: key);

//   _TopNavWtState createState() => _TopNavWtState();
// }

// class _TopNavWtState extends State<TopNavWt> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: ScreenUtil().setHeight(260),
//       margin: EdgeInsets.all(10.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: topNavList.sublist(0,5).map((item) {
//               return _gridViewItem(context, item);
//             }).toList(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: topNavList.sublist(5).map((item) {
//               return _gridViewItem(context, item);
//             }).toList(),
//           )
//         ],
//       ),
//     );
//   }
// }
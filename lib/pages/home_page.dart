import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/pages/member_page.dart';
import 'package:flutter_jinrizaixian/widget/MyDrawer.dart';
import 'package:flutter_jinrizaixian/widget/SwiperWt.dart';
import 'package:flutter_jinrizaixian/widget/TopNavWt.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List swiperList = [
    'https://img.alicdn.com/tfs/TB15mRQeAY2gK0jSZFgXXc5OFXa-750-291.jpg_Q90.jpg',
    'https://img.alicdn.com/tfs/TB1PHweemf2gK0jSZFPXXXsopXa-750-291.jpg_Q90.jpg',
    'https://img.alicdn.com/tfs/TB13vIlerj1gK0jSZFuXXcrHpXa-750-291.jpg_Q90.jpg',
    'https://gw.alicdn.com/tfs/TB1fwKYexv1gK0jSZFFXXb0sXXa-750-291.jpg_Q90.jpg',
    'https://gw.alicdn.com/tfs/TB1x2Qlerj1gK0jSZFOXXc7GpXa-750-291.jpg_Q90.jpg',
    'https://img.alicdn.com/tfs/TB1kqEiepY7gK0jSZKzXXaikpXa-750-291.jpg_Q90.jpg'
  ];

  List topNavList = [
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
  ];
  
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('首页'),
    //     centerTitle: true,
    //     actions: <Widget>[
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         onPressed: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(
    //               builder: (context) => MemberPage()
    //             )
    //           );
    //           print('点击了搜索');
    //         },
    //       ),
    //     ],
    //     leading: Icon(Icons.ac_unit),
    //   ),
    //   drawer: MyDrawer(),
    //   body: ListView(
    //     children: <Widget>[
    //       SwiperWt(swiperList: swiperList),
    //       // TopNavWt(topNavList: topNavList),
    //       TopNavWt(),
    //       Container(
    //         child: Text('aa')
    //       )
    //     ],
    //   ),
    // );
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(text:'热门'),
                    Tab(text:'热门'),
                    Tab(text:'热门'),
                    Tab(text:'热门'),
                    Tab(text:'热门'),
                    Tab(text:'热门'),
                    Tab(text:'热门2'),
                  ],
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MemberPage()
                  )
                );
                print('点击了搜索');
              },
            ),
          ],
          // leading: Icon(Icons.ac_unit),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text:'热门'),
              Tab(text:'热门'),
              Tab(text:'热门'),
              Tab(text:'热门'),
              Tab(text:'热门'),
              Tab(text:'热门'),
              Tab(text:'热门2'),
            ],
          )
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          children: <Widget>[
            ListTile(
              title: Text('aaa'),
            ),
            ListTile(
              title: Text('bb'),
            ),
            ListTile(
              title: Text('aaa'),
            ),
            ListTile(
              title: Text('aaa'),
            ),
            ListTile(
              title: Text('aaa'),
            ),
            ListTile(
              title: Text('aaa'),
            ),
            ListTile(
              title: Text('aaa'),
            ),
          ],
        )
      )
    );
  }
}


// class SwiperWt extends StatelessWidget {
//   final List swiperList;

//   const SwiperWt({Key key, this.swiperList}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List swiperList = [
//       'https://img.alicdn.com/tfs/TB15mRQeAY2gK0jSZFgXXc5OFXa-750-291.jpg_Q90.jpg',
//       'https://img.alicdn.com/tfs/TB1PHweemf2gK0jSZFPXXXsopXa-750-291.jpg_Q90.jpg',
//       'https://img.alicdn.com/tfs/TB13vIlerj1gK0jSZFuXXcrHpXa-750-291.jpg_Q90.jpg',
//       'https://gw.alicdn.com/tfs/TB1fwKYexv1gK0jSZFFXXb0sXXa-750-291.jpg_Q90.jpg',
//       'https://gw.alicdn.com/tfs/TB1x2Qlerj1gK0jSZFOXXc7GpXa-750-291.jpg_Q90.jpg',
//       'https://img.alicdn.com/tfs/TB1kqEiepY7gK0jSZKzXXaikpXa-750-291.jpg_Q90.jpg'
//     ];
//     return Column(
//       children: swiperList.map((item) {
//         return Image.network(item);
//       }).toList(),
//     );
//   }
// }
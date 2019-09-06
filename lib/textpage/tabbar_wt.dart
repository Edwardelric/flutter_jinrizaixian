import 'package:flutter/material.dart';

class TabBarWt extends StatefulWidget {
  TabBarWt({Key key}) : super(key: key);

  _TabBarWtState createState() => _TabBarWtState();
}

class _TabBarWtState extends State<TabBarWt> with SingleTickerProviderStateMixin{
  
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(
      vsync: this,
      length: 2
    );
    _tabController.addListener(() {
      print(_tabController.index);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabbar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: '推荐'),
            Tab(text: '推荐2'),
          ],
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text('aaa')
          ),
          Container(
            alignment: Alignment.center,
            child: Text('bb')
          )
        ],
      )
    );
  }
}
// class TabBarWt extends StatelessWidget {
//   const TabBarWt({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: <Widget>[
//               Expanded(
//                 child: TabBar(
//                   isScrollable: true,
//                   tabs: <Widget>[
//                     Tab(text: '热门1'),
//                     Tab(text: '热门1'),
//                     Tab(text: '热门1'),
//                     Tab(text: '热门1'),
//                     Tab(text: '热门1'),
//                     Tab(text: '热门1'),
//                   ],
//                 ),
//               )
//             ], 
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             ListTile(
//               title: Text('aa'),
//             ),
//             ListTile(
//               title: Text('aa'),
//             ),
//             ListTile(
//               title: Text('aa'),
//             ),
//             ListTile(
//               title: Text('aa'),
//             ),
//             ListTile(
//               title: Text('aa'),
//             ),
//             ListTile(
//               title: Text('aa'),
//             ),
//           ],
//         )
//       )
//     );
//   }
// }
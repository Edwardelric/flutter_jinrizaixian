import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String goodsId;
  DetailPage(this.goodsId, {Key key}) : super(key: key);

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(
      vsync: this,
      // length: 6
      length: 2
    );
    _tabController.addListener(() {
      print(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.goodsId);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
        bottom: TabBar(
          // isScrollable: true,
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: '详细'),
            Tab(text: '评论'),
            // Tab(text: '详细1'),
            // Tab(text: '评论2'),
            // Tab(text: '详细3'),
            // Tab(text: '评论4'),
          ],
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '当前商品id: ${widget.goodsId}'
            )
          ),
          Container(
            alignment: Alignment.center,
            child: Text('评论数据内容')
          ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text(
          //     '当前商品id: ${widget.goodsId}:1'
          //   )
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text('评论数据内容:2')
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text(
          //     '当前商品id: ${widget.goodsId}:3'
          //   )
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   child: Text('评论数据内容:4')
          // )
        ],
      )
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final String goodsId;
//   const DetailPage(this.goodsId, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('搜索')
//       ),
//       body: Container(
//         child: Text(
//           '当前的商品id:${goodsId}'
//         ),
//       ),
//     );
//   }
// }
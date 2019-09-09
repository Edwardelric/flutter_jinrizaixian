import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:flutter_jinrizaixian/http/http_url.dart';
import 'package:flutter_jinrizaixian/model/goodsListModel.dart';

class NoticesPage extends StatefulWidget {
  NoticesPage({Key key}) : super(key: key);

  _NoticesPageState createState() => _NoticesPageState();
}

class _NoticesPageState extends State<NoticesPage> {

  int curPage = 0;
  List noticeLists = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  void initState() { 
    this.getNoticesData(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公告栏'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (index) {
              print(index);
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>> [
              new PopupMenuItem(
                value: '0',
                child: new Text('刷新')
              ),
              new PopupMenuItem(
                value: '1',
                  child: new Text('跳转')
              )
            ]
          ),
        ],
      ),
      body: EasyRefresh(
        child: ListView.builder(
          itemCount: noticeLists.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
                )
              ),
              title: Text(
                '当前第${curPage}页, 第${noticeLists[index]}条'
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
            );
          },
        ),
        loadMore: () async {
          print('开始上拉更多');
          this.getNoticesData(true);
        },
        onRefresh: () async {
          print('开始下拉更多');
          this.getNoticesData(false);
        },
      ),
    );
  }

  void getNoticesData(bool flag) {
    getCategoryData({}).then((res) {
      GoodsListModel modelRes = GoodsListModel.fromJson(res);
      setState(() {
        curPage++;
        List tmp = [];
        for(int i = curPage*10; i < curPage*10+10; i++) {
          tmp.add(i);
        }
        if (flag) {
          noticeLists.addAll(tmp);
        } else {
          noticeLists.insertAll(0, tmp);
        }
        
        print(noticeLists);
      });
    });
  }
}
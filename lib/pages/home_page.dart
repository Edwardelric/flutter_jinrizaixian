import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/http/http_url.dart';
import 'package:flutter_jinrizaixian/widget/MyDrawer.dart';
import 'package:flutter_jinrizaixian/widget/SwiperWt.dart';
import 'package:flutter_jinrizaixian/widget/TopNavWt.dart';
import 'package:flutter_jinrizaixian/widget/goodsListWt.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页分享'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search');
            }
          ),
        ],
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: (){
        //     print('ccc');
        //   },
        // ),
      ),
      // body: Container(
      //   height: ScreenUtil().setHeight(300.0),
      //   child: Swiper(
      //     itemBuilder: (BuildContext context,int index){
      //       return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
      //     },
      //     itemCount: 3,
      //     pagination: new SwiperPagination(),
      //     control: new SwiperControl(),
      //   ),
      // ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: getShareMockData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              List<String> swiperList = [];
              snapshot.data.forEach((item) {
                swiperList.add(item['PICTURE_COMPERSS_PATH']);
              });
              List<Map> topNavList = [];
              snapshot.data.forEach((item) {
                topNavList.add({
                  'name': item['NAME'],
                  'image': item['IMAGE1']
                });
              });
              return ListView(
                children: <Widget>[
                  SwiperWt(swiperList: swiperList),
                  TopNavWt(topNavList: topNavList),
                  GoodsListWt()
                ],
              );
              
              // return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求未结束，显示loading
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.green),   // 进度条颜色设置
              )
            );
          }
        },
      )
    );
  }
}

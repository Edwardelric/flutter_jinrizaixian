import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_jinrizaixian/pages/category_page.dart';
import 'package:flutter_jinrizaixian/pages/home_page.dart';
import 'package:flutter_jinrizaixian/pages/notice_page.dart';
import 'package:flutter_jinrizaixian/pages/member_page.dart';
import 'package:flutter_jinrizaixian/widget/MyDrawer.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  
  Widget currentPage;

  List<Widget> pageLists = [
    HomePage(),
    NoticesPage(),
    CategoryPage(),
    MemberPage()
  ];

  List<BottomNavigationBarItem>  bottomNavigationBarItem =[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      title: Text('公告'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('个人中心'),
    ),
  ];

  @override
  void initState() { 
    currentPage = pageLists[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('首页分析'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.file_download),
      //       onPressed: () {
      //         print('aaa');
      //       }
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.share),
      //       onPressed: () {
      //         print('bbb');
      //       }
      //     ),
      //   ],
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.menu),
      //   //   onPressed: (){
      //   //     print('ccc');
      //   //   },
      //   // ),
      // ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationBarItem,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = pageLists[index];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pageLists,
      )
    );
  }
}
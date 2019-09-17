import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_jinrizaixian/pages/category_page.dart';
import 'package:flutter_jinrizaixian/pages/home_page.dart';
import 'package:flutter_jinrizaixian/pages/notice_page.dart';
import 'package:flutter_jinrizaixian/pages/member_page.dart';
import 'package:flutter_jinrizaixian/widget/MyDrawer.dart';

import 'package:fluwx/fluwx.dart' as fluwx;

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
    _initFluwx();
  }

   _initFluwx() async {
    await fluwx.register(
        appId: "wxd930ea5d5a258f4f",
        doOnAndroid: true,
        doOnIOS: true,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
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
      floatingActionButton: Container(
        width: 46.0,
        height: 46.0,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            print('aa');
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      //   child: Row(
      //     children: [
      //       IconButton(
      //         onPressed: (){
      //           setPage(0);
      //         },
      //         icon: Icon(Icons.home, color: checkColor(0))
      //       ),
      //       IconButton(
      //         onPressed: (){
      //           setPage(1);
      //         },
      //         icon: Icon(Icons.notifications, color: checkColor(1))
      //       ),
      //       SizedBox(), //中间位置空出
      //       IconButton(
      //         onPressed: () {
      //           setPage(2);
      //         },
      //         icon: Icon(Icons.list, color: checkColor(2))
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           setPage(3);
      //         },
      //         icon: Icon(Icons.person, color: checkColor(2))
      //       ),
      //     ],
      //     mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      //   ),
      // ),
      body: IndexedStack(
        index: currentIndex,
        children: pageLists,
      )
    );
  }

  Color checkColor(int index) {
    if (currentIndex == index) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  void setPage(int index) {
    setState(() {
      currentIndex = index;
      currentPage = pageLists[index];
    });
  }
}
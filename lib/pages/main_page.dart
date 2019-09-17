import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jinrizaixian/textpage/tabbar_wt.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_jinrizaixian/textpage/wrap_wt.dart';
import 'package:flutter_jinrizaixian/textpage/stack_wt.dart';
import 'package:flutter_jinrizaixian/textpage/aspectRatio.dart';
import 'package:flutter_jinrizaixian/textpage/container_text.dart';
import 'package:flutter_jinrizaixian/textpage/imagenetwork.dart';
import 'package:flutter_jinrizaixian/textpage/listview_wt.dart';
import 'package:flutter_jinrizaixian/textpage/gridview_wt.dart';
import 'package:flutter_jinrizaixian/textpage/column_row.dart';

import 'package:flutter_jinrizaixian/pages/home_page.dart';
import 'package:flutter_jinrizaixian/pages/category_page.dart';
import 'package:flutter_jinrizaixian/pages/cart_page.dart';
import 'package:flutter_jinrizaixian/pages/member_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 当前页面索引值
  int currentIndex = 0;
  // 当前页面
  Widget currentPage;
  // 页面列表
  final List<Widget> pagesList = [
    TabBarWt(),
    // WrapWt(),
    // AspectRatioWt(),
    // StackWt(),
    // ColumnRow(),
    // GridViewWt(),
    // ListViewWt(),
    // ImageNetwork(),
    // ContainerText(),
    // HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('搜索')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    )
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNav,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = pagesList[index];
          });
        }
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pagesList,
      ),
    );
  }
}
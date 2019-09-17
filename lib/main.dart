import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/pages/main_page.dart';
import 'package:flutter_jinrizaixian/provide/category_goods_list.dart';
import 'package:flutter_jinrizaixian/provide/child_category.dart';

import 'package:provide/provide.dart';
import './provide/counter.dart';


void main() {
  Providers providers = Providers();
  Counter counter =Counter();
  ChildCategory childCategory = ChildCategory();
  CategoryGoodsListProvide categoryGoodsListProvide = CategoryGoodsListProvide();
  providers
    ..provide(Provider<Counter>.value(counter));

  providers
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));
  // runApp(MyApp());
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_share',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.green
      ),
      home: MainPage()
    );
  }
}
 
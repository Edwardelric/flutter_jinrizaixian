import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/model/good_category_list.dart';


class CategoryGoodsListProvide with ChangeNotifier {

  List<GoodCategoryListData> goodsList = [];

  getGoodsList(List<GoodCategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }
}
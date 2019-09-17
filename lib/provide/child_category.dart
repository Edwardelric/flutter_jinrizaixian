import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/mock/good_category.dart';


class ChildCategory with ChangeNotifier{
  
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;
  String categoryId = '4';

  getChildCategory(List<BxMallSubDto> list, String id) {
    categoryId=id;
    childIndex = 0;
    BxMallSubDto all=  BxMallSubDto();
    all.mallSubId='00';
    all.mallCategoryId='00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList=[all];
    childCategoryList.addAll(list);   
    notifyListeners();
  }

  changeChildIndex(index) {
    childIndex = index;
    notifyListeners();
  }

}
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_jinrizaixian/pages/detail_page.dart';
import 'package:flutter_jinrizaixian/pages/search_page.dart';


Handler searchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('index>SearchPage');
    return SearchPage();
  }
);

Handler detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id'].first;
    print('index>details goodsID is ${goodsId}');
    return DetailPage(goodsId);
  }
);


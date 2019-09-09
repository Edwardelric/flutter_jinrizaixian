import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_jinrizaixian/pages/jsontodart_page.dart';

Handler jsonToDartHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    print('index>JsonToDartPage');
    return JsonToDartPage();

  }
);
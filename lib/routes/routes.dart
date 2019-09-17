import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_jinrizaixian/routes/router_handler.dart';


class Routes {
  static String root = '/';
  static String searchPage = '/search';
  static String detailPage = '/detail';
  static void configureRoutes(Router router){    
    router.notFoundHandler= new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );
    router.define(searchPage, handler:searchHandler, transitionType: TransitionType.inFromRight);
    router.define(detailPage, handler:detailHandler, transitionType: TransitionType.inFromRight);
  }
}
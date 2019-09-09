import './http.dart';

import 'package:flutter_jinrizaixian/mock/getShareMockData.dart';
import 'package:flutter_jinrizaixian/mock/getCategoryData.dart';

const domainUrl = 'https://www.easy-mock.com/mock/5d5ba089af6abb3d1b4270d1/api';

// 分享使用的请求数据                   
Future getShareMockData() async {
  return GetShareMockDataJson().data;
  // return await HttpUtil().post('${domainUrl}/fluttersharedata#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
}
// getCategoryData
Future getCategoryData(Map data) async {  
  return GetCategoryDataJson().data;
  // return await HttpUtil().post('${domainUrl}/homepagecontent#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D', data:data);
}



Future getHomePageData() async { // 首页数据
  // return await HttpUtil().post('${domainUrl}/good#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
  return await HttpUtil().post('${domainUrl}/homepage#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
}

// Future getHomePageContentData(Map data) async {  // 首页商品列表
//   return await HttpUtil().post('${domainUrl}/homepagecontent#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D', data:data);
// }

// Future getCategoryData() async { // 商品列表
//   return await HttpUtil().post('${domainUrl}/getcategory#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
// }

Future getCategoryList(Map data) async { // 商品分类的商品列表
  return await HttpUtil().post('${domainUrl}/getmailgoods#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D', data: data);
}

Future getGoodDetailById(Map data) async { // 商品详情页
  return await HttpUtil().post('${domainUrl}/getgoodsdetail#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D', data: data);
}




Future getTopNavData() async {
  return await HttpUtil().post('${domainUrl}/bannerData#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
}

Future getCategory() async {
  return await HttpUtil().post('${domainUrl}/categorydata#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
}

Future getRightGoodsData() async {
  return await HttpUtil().post('${domainUrl}/rightgoods#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D');
}



// Future request(url,{formData})async{
//     try{
//       //print('开始获取数据...............');
//       Response response;
//       Dio dio = new Dio();
//       dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
//       response = await dio.post(url);
//       if(response.statusCode==200){
//         return response.data;
//       }else{
//           throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
//       }
//     }catch(e){
//         return print('ERROR:======>${e}');
//     }
     
// }

// Future getBannerData() async {
//   await Future.wait(
//     [
//       HttpUtil.getInstance().post('${domainUrl}/categorydata#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D'),
//       HttpUtil.getInstance().post('${domainUrl}/bannerData#!method=POST&queryParameters=%5B%5D&body=&headers=%5B%5D')
//     ]
//   );
//   // return await Future.wait([dio.post("/info"),dio.get("/token")]);
// }


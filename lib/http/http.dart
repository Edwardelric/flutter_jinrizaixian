import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import './http_url.dart';


class HttpUtil {

  static HttpUtil instance;
  Dio dio;
  BaseOptions options;
  CancelToken cancelToken = new CancelToken();
  
  static HttpUtil getInstance() {
    if (null == instance) {
      instance = new HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    options = new BaseOptions(
      baseUrl: domainUrl,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头. 
      headers: {
        //do something
        "version": "1.0.0"
      },
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
      contentType: ContentType.json,
      //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );
     
    dio = new Dio(options);
    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('请求前');
      // Loading.before('正在加速中...');
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   showDialog<Widget>(
      //       context: options.extra['context'],
      //       // 如果不加，点击外部导致dialog消失，在请求完成后会pop掉本来的界面
      //       barrierDismissible: false,
      //       builder: (context) => Container(child: Center(child: CircularProgressIndicator())));
      // });
      return options; 
    }, onResponse: (Response response) {
      // Navigator.pop(response.request.extra['context']);
      print('响应前');
      return response;
    }, onError: (DioError e) {
      // Navigator.pop(e.request.extra['context']);
      print('错误之前');
      return e;
    }));
    

  }

  /*
   * get请求
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url, queryParameters: data, options: options, cancelToken:  cancelToken);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url, data: data, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,onReceiveProgress: (int count, int total){
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

}

Future request(url,{formData})async{
    try{
      print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
      // if(formData==null){
    
      response = await dio.get('http://localhost:3000/goods/showGoodsInfo');
      // }else{
          // response = await dio.post(servicePath[url],data:formData);
      // }
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print('ERROR:======>${e}');
    }
     
}
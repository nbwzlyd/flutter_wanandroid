import 'package:dio/dio.dart';
import 'package:flutter_app/login.dart';

import 'dart:async';

import 'package:flutter_app/widgets/api/WanAndroidApi.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = WanAndroidApi.baseUrl;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  //url 请求链接
  //parameters 请求参数
  //metthod 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static Future<dynamic> _request<T>(String url,
      {parameters,
      method}) async {
    Dio dio = createInstance();
    /// 打印:请求地址-请求方式-请求参数
    print('请求地址：【' + method + '  ' + dio.options.baseUrl + '】');
    print('请求参数：' + parameters.toString());
    //请求结果
    var result;
    try {
      Response response = await dio.request(url, queryParameters: parameters, options: Options(method: method));
      result = response.data;
      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
    }
   return result;
  }


  static Future post<T>(String url,
      {parameters,
        method}) async {
    return _request<T>(url, parameters: parameters, method: POST);
  }

  static Future get<T>(String url,
      {parameters,
        method}) async {
   return _request<T>(url, parameters: parameters, method: GET);
  }


  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        responseType: ResponseType.plain,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: API_PREFIX,
      );

      dio = new Dio(options);
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}

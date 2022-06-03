import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/widgets/api/WanAndroidApi.dart';
import 'package:flutter_app/widgets/api/util/dio_util.dart';
import 'package:flutter_app/widgets/login/bean/UserBeanEntity.dart';

class LoginRepository {
  Future<UserBeanEntity> login(loginBody) async {
    UserBeanEntity userBeanEntity;
    await DioUtils.post<Map<String, dynamic>>(WanAndroidApi.user_login,
            parameters: loginBody.queryParameters2Map())
        .then((result) {
      userBeanEntity = UserBeanEntity.fromJson(jsonDecode(result));
    }).catchError((onError){
    });

    return userBeanEntity;
  }
}

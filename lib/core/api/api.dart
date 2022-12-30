import 'dart:convert';

import 'package:blesket/models/user/user.dart';
import 'package:blesket/utils/constants.dart';
import 'package:blesket/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApiAbstract {
  User? user;
  void refeshAuth();
  Future<Response> getHTTP(
      {required String endpoint, Map<String, dynamic>? params});
  Future<Response> post(
      {required String endpoint, required Map<String, dynamic> params});
}

class Api implements ApiAbstract {
  @override
  User? user;
  final Dio _dio = Dio();
  @override
  Future<Response> getHTTP(
      {required String endpoint, Map<String, dynamic>? params}) async {
    logger.i("'$baseUrl$endpoint'");
    final prefs = await SharedPreferences.getInstance();
    user = User.fromJson(jsonDecode(prefs.getString('creds')!));

    return _dio.get('$baseUrl$endpoint',
        queryParameters: params,
        options: Options(headers: <String, String>{
          'authorization': 'Bearer ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  Future<Response> post(
      {required String endpoint, required Map<String, dynamic> params}) async {
    logger.i('$baseUrl$endpoint');
    final prefs = await SharedPreferences.getInstance();
    user = User.fromJson(jsonDecode(prefs.getString('creds')!));

    return _dio.post('$baseUrl$endpoint',
        data: FormData.fromMap(params),
        options: Options(headers: <String, String>{
          'authorization': 'Bearer ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  void refeshAuth() async {
    // TODO: implement refeshAuth
    final prefs = await SharedPreferences.getInstance();
    user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    logger.i("--refresh token =$user");
  }
}

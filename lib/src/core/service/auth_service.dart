import 'dart:ffi';

import 'package:akgamarra_app/src/core/model/request/save_user_request.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8980/auth";

  AuthService({required this.dio});

  Future<Void?> save(SaveUserRequest request, String bearerToken) async {
    var options = Options(headers: {"Authorization": "Bearer $bearerToken"});
    try {
      await dio.post(_urlBase, options: options, data: request.toJson());
    } catch (e, stacktrace) {
      throw Error();
    }
  }
}

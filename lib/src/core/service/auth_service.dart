import 'dart:developer';

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;
  final String URL_BASE = "http://69.197.164.187:8980";

  AuthService({required this.dio});

  Future<UserResponse?> validateToken(String token) async {
    final String METHOD_PATH = '$URL_BASE/auth/validate';
    var options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      log("Enviando token al backend: $token");
      final response = await dio.get(METHOD_PATH, options: options);
      return UserResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      log(e.toString());
      return null;
    }
  }
}

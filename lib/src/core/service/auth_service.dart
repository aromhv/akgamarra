import 'dart:developer';

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8980/auth";

  AuthService({required this.dio});

  Future<UserResponse?> validateToken(String bearerToken, String fcmDeviceToken) async {
    var options = Options(headers: {"Authorization": "Bearer $bearerToken", "device": fcmDeviceToken});
    try {
      final response = await dio.get('$_urlBase/validate', options: options);
      return UserResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      log(e.toString());
    }
  }
}

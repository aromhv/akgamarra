import 'dart:developer';

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8980";

  AuthService({required this.dio});

  Future<UserResponse?> validateToken(String token) async {
    final String methodPath = '$_urlBase/auth/validate';
    final fcmToken = await FirebaseMessaging.instance.getToken();
    var options = Options(headers: {"Authorization": "Bearer $token", "device": fcmToken});

    try {
      log("Enviando token al backend: $token");
      final response = await dio.get(methodPath, options: options);
      return UserResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      log(e.toString());
    }
  }
}

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:akgamarra_app/src/core/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final Dio dio;
  final LoginService loginService;

  AuthService({required this.dio, required this.loginService});

  Future<UserResponse?> getUser() async {
    try {
      Response<UserResponse> response = await dio.get(
        'http://192.168.1.6:8080/auth/verify-token',
        options: Options(
          headers: {"Authorization": "Bearer $loginService.token"},
        ),
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }
}

import 'dart:developer';

import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:dio/dio.dart';

class UserService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8987/user";

  UserService({required this.dio});

  Future<UserResponse?> retrieveUser(String bearerToken) async {
    var options = Options(headers: {"Authorization": "Bearer $bearerToken"});
    try {
      final response = await dio.get(_urlBase, options: options);
      return UserResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      log(e.toString());
    }
  }
}

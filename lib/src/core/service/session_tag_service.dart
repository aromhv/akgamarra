import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';

class SessionTagService {
  final Dio _dio;
  final String _urlBase = "http://69.197.164.187:8986/session-tags";

  SessionTagService({required Dio dio}) : _dio = dio;

  Future<Void?> save(String token) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});
    try {
      await _dio.post(_urlBase, options: options);
    } catch (e, stacktrace) {
      log("error");
      log(e.toString());
    }
  }
}

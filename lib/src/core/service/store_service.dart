import 'package:akgamarra_app/src/core/model/request/store_request.dart';
import 'package:akgamarra_app/src/core/model/response/store_response.dart';
import 'package:dio/dio.dart';

class StoreService {
  final Dio dio;
  final String URL_BASE = "http://69.197.164.187:8982/store";

  StoreService({required this.dio});

  Future<StoreResponse?> save(String token, StoreRequest request) async {
    final String METHOD_PATH = '$URL_BASE/save';
    var options = Options(
      headers: {
        "Authorization": "Bearer $token",
        "content-type": "application/json",
      },
    );

    try {
      final response = await dio.post(
        METHOD_PATH,
        options: options,
        data: request.toJson(),
      );
      return StoreResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      return null;
    }
  }

  Future<StoreResponse?> findById(String token, String id) async {
    final String METHOD_PATH = '$URL_BASE/retrieve/$id';
    var options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      final response = await dio.get(METHOD_PATH, options: options);
      return StoreResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      return null;
    }
  }
}

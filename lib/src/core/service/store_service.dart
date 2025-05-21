import 'package:akgamarra_app/src/core/model/request/save_store_request.dart';
import 'package:akgamarra_app/src/core/model/response/store_response.dart';
import 'package:dio/dio.dart';

class StoreService {
  final Dio dio;
  final String URL_BASE = "http://69.197.164.187:8982/store";

  StoreService({required this.dio});

  Future<StoreResponse?> save(String token, SaveStoreRequest request) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});
    try {
      final response = await dio.post('$URL_BASE/save', options: options, data: request.toJson());
      return StoreResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      return null;
    }
  }

  Future<StoreResponse?> findById(String token, String id) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});
    try {
      final response = await dio.get('$URL_BASE/retrieve/$id', options: options);
      return StoreResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      return null;
    }
  }

  Future<Set<String>> retrieveTags(String token) async {
    final options = Options(headers: {"Authorization": "Bearer $token"});
    try {
      final response = await dio.get('$URL_BASE/metadata/tags', options: options);
      return response.data.whereType<String>().toSet();
    } catch (e, stackTrace) {
      return <String>{};
    }
  }
}

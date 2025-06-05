import 'package:akgamarra_app/src/core/model/request/save_store_request.dart';
import 'package:akgamarra_app/src/core/model/response/store_response.dart';
import 'package:dio/dio.dart';

class StoreService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8982/store";

  StoreService({required this.dio});

  Future<StoreResponse?> save(String token, SaveStoreRequest request) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});
    try {
      final response = await dio.post('$_urlBase/save', options: options, data: request.toJson());
      return StoreResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      return null;
    }
  }

  Future<Set<String>> retrieveTags(String token) async {
    final options = Options(headers: {"Authorization": "Bearer $token"});
    try {
      final response = await dio.get('$_urlBase/metadata/tags', options: options);
      return response.data.whereType<String>().toSet();
    } catch (e, stackTrace) {
      return <String>{};
    }
  }
}

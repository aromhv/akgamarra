import 'package:akgamarra_app/src/core/model/response/brand_response.dart';
import 'package:akgamarra_app/src/core/model/response/category_response.dart';
import 'package:akgamarra_app/src/core/model/response/target_response.dart';
import 'package:dio/dio.dart';

class MetadataProductService {
  final Dio dio;
  final String URL_BASE = "http://69.197.164.187:8981/store-products/metadata";

  MetadataProductService({required this.dio});

  Future<List<BrandResponse>> retrieveBrands(String token) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      final response = await dio.get('$URL_BASE/brands', options: options);
      return (response.data as List)
          .map((item) => BrandResponse.fromJson(item))
          .toList();
    } catch (e, stacktrace) {
      throw Error();
    }
  }

  Future<List<TargetResponse>> retrieveTargets(String token) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      final response = await dio.get('$URL_BASE/targets', options: options);
      return (response.data as List)
          .map((item) => TargetResponse.fromJson(item))
          .toList();
    } catch (e, stacktrace) {
      throw Error();
    }
  }

  Future<List<CategoryResponse>> retrieveCategories(
      String token,
      String? target,
      ) async {
    Map<String, dynamic> headers;
    if (target != null) {
      headers = {"target": target, "Authorization": "Bearer $token"};
    } else {
      headers = {"Authorization": "Bearer $token"};
    }

    try {
      final response = await dio.get(
        '$URL_BASE/category',
        options: Options(headers: headers),
      );
      return (response.data as List)
          .map((item) => CategoryResponse.fromJson(item))
          .toList();
    } catch (e, stacktrace) {
      throw Error();
    }
  }
}

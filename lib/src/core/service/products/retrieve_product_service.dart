import 'package:akgamarra_app/src/core/model/request/retrieve_product_request.dart';
import 'package:akgamarra_app/src/core/model/response/retrieve_products_response.dart';
import 'package:dio/dio.dart';

class RetrieveProductService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8988/retrieve-store-products";

  RetrieveProductService({required this.dio});

  Future<RetrieveProductsResponse> retrieve(String token, RetrieveProductRequest request) async {
    var options = Options(headers: {"Authorization": "Bearer $token", "page": request.page});
    if (request.brand != null && request.brand != "") options.headers?["brand"] = request.brand;
    if (request.target != null && request.target != "") options.headers?["target"] = request.target;
    if (request.category != null && request.category != "") options.headers?["category"] = request.category;

    try {
      final response = await dio.get(_urlBase, options: options);
      return RetrieveProductsResponse.fromJson(response.data);
    } catch (e, stacktrace) {
      throw Error();
    }
  }
}

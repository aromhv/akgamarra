import 'dart:ffi';

import 'package:akgamarra_app/src/core/model/request/save_product_request.dart';
import 'package:dio/dio.dart';

class ProductService {
  final Dio dio;
  final String URL_BASE = "http://69.197.164.187:8981/store-products";

  ProductService({required this.dio});

  Future<Void?> save(String token, SaveProductRequest request) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      await dio.post('$URL_BASE/save', options: options, data: request.toJson());
    } catch (e, stacktrace) {
      throw Error();
    }
  }
}

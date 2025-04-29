import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/request/retrieve_product_request.dart';
import 'package:akgamarra_app/src/core/model/response/retrieve_products_response.dart';
import 'package:akgamarra_app/src/core/service/product_service.dart';
import 'package:flutter/cupertino.dart';

class RetrieveProductsHandler {
  final AuthContext authState;
  final ProductService productService;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  RetrieveProductsHandler(this.authState, this.productService);

  Future<RetrieveProductsResponse> retrieve(
    RetrieveProductRequest request,
  ) async {
    isLoading.value = true;
    try {
      var token = authState.token;
      return await productService.retrieve(token!, request);
    } finally {
      isLoading.value = false;
    }
  }
}

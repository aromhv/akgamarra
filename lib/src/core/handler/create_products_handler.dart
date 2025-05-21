import 'dart:ffi';

import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/request/save_product_request.dart';
import 'package:akgamarra_app/src/core/service/products/product_service.dart';
import 'package:flutter/cupertino.dart';

class CreateProductsHandler {
  final AuthContext authState;
  final ProductService productService;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  CreateProductsHandler(this.authState, this.productService);

  Future<Void?> create(SaveProductRequest request) async {
    isLoading.value = true;
    try {
      var token = authState.token;
      await productService.save(token!, request);
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/request/store_request.dart';
import 'package:akgamarra_app/src/core/model/response/store_response.dart';
import 'package:akgamarra_app/src/core/service/store_service.dart';
import 'package:flutter/cupertino.dart';

class SaveStoreHandler {
  final AuthContext authState;
  final StoreService storeService;

  final ValueNotifier<bool> isSaving = ValueNotifier(false);

  SaveStoreHandler(this.authState, this.storeService);

  Future<StoreResponse?> save(StoreRequest request) async {
    isSaving.value = true;
    try {
      var token = authState.token;
      return await storeService.save(token!, request);
    } finally {
      isSaving.value = false;
    }
  }
}

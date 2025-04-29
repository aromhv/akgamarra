import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/store_response.dart';
import 'package:akgamarra_app/src/core/service/store_service.dart';

class FindByIdStoreHandler {
  final AuthContext authState;
  final StoreService storeService;

  FindByIdStoreHandler(this.authState, this.storeService);

  Future<StoreResponse?> findById() async {
    var token = authState.token;
    var user = authState.user;
    final response = await storeService.findById(token!, user!.storeId!);
    return response;
  }
}

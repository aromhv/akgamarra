import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/service/store_service.dart';

class RetrieveTagHandler {
  final AuthContext authState;
  final StoreService storeService;

  RetrieveTagHandler(this.authState, this.storeService);

  Future<Set<String>?> retrieve() async {
    var token = authState.token;
    return await storeService.retrieveTags(token!);
  }
}

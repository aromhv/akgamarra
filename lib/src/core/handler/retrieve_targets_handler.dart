import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/target_response.dart';
import 'package:akgamarra_app/src/core/service/metadata_product_service.dart';

class RetrieveTargetsHandler {
  final AuthContext authState;
  final MetadataProductService storeService;

  RetrieveTargetsHandler(this.authState, this.storeService);

  Future<List<TargetResponse>> retrieve() async {
    var token = authState.token;
    return await storeService.retrieveTargets(token!);
  }
}

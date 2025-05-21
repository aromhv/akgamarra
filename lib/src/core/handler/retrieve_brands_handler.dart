import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/brand_response.dart';
import 'package:akgamarra_app/src/core/service/products/retrieve_product_metadata_service.dart';

class RetrieveBrandsHandler {
  final AuthContext authState;
  final RetrieveProductMetadataService metadataProductService;

  RetrieveBrandsHandler(this.authState, this.metadataProductService);

  Future<List<BrandResponse>> retrieve() async {
    var token = authState.token;
    return await metadataProductService.retrieveBrands(token!);
  }
}

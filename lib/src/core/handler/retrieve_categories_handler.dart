import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/category_response.dart';
import 'package:akgamarra_app/src/core/service/products/retrieve_product_metadata_service.dart';

class RetrieveCategoriesHandler {
  final AuthContext authState;
  final RetrieveProductMetadataService metadataProductService;

  RetrieveCategoriesHandler(this.authState, this.metadataProductService);

  Future<List<CategoryResponse>> retrieve(String? target) async {
    var token = authState.token;
    return await metadataProductService.retrieveCategories(token!, target);
  }
}

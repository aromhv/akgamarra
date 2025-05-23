import 'package:akgamarra_app/src/core/model/response/retrieve_product_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'retrieve_products_response.g.dart';

@JsonSerializable()
class RetrieveProductsResponse {
  int page;
  List<RetrieveProductResponse>? products;

  RetrieveProductsResponse({required this.page});

  factory RetrieveProductsResponse.fromJson(Map<String, dynamic> json) => _$RetrieveProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RetrieveProductsResponseToJson(this);
}

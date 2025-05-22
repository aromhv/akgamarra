import 'package:json_annotation/json_annotation.dart';

part 'retrieve_product_response.g.dart';

@JsonSerializable()
class RetrieveProductResponse {
  String id;
  String name;
  String target;
  String category;
  String imageUrl;
  String brand;

  RetrieveProductResponse({
    required this.id,
    required this.name,
    required this.target,
    required this.category,
    required this.imageUrl,
    required this.brand,
  });

  factory RetrieveProductResponse.fromJson(Map<String, dynamic> json) => _$RetrieveProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RetrieveProductResponseToJson(this);
}

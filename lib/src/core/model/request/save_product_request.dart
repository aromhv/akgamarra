import 'package:json_annotation/json_annotation.dart';

part 'save_product_request.g.dart';

@JsonSerializable()
class SaveProductRequest {
  String name;
  String description;
  double displayPrice;

  String imageUrl;

  String brand;
  String target;
  String category;

  SaveProductRequest({
    required this.name,
    required this.brand,
    required this.target,
    required this.displayPrice,
    required this.imageUrl,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$SaveProductRequestToJson(this);

  bool isValid() => (brand != "") && (target != "") && (category != "");
}

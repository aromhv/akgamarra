import 'package:json_annotation/json_annotation.dart';

part 'retrieve_product_request.g.dart';

@JsonSerializable()
class RetrieveProductRequest {
  int page;
  String? brand;
  String? target;
  String? category;

  RetrieveProductRequest({required this.page, required this.brand, required this.target, required this.category});

  Map<String, dynamic> toJson() => _$RetrieveProductRequestToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'retrieve_product_request.g.dart';

@JsonSerializable()
class RetrieveProductRequest {
  int page;
  int items;
  String category;
  String target;

  RetrieveProductRequest({
    required this.page,
    required this.items,
    required this.target,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$RetrieveProductRequestToJson(this);
}

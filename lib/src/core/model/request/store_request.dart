import 'package:json_annotation/json_annotation.dart';

part 'store_request.g.dart';

@JsonSerializable()
class StoreRequest {
  String name;
  Set<String> tags;
  String description;
  Map<String, String> legalDocument;

  StoreRequest({
    required this.name,
    required this.tags,
    required this.description,
    required this.legalDocument,
  });

  Map<String, dynamic> toJson() => _$StoreRequestToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'store_request.g.dart';

@JsonSerializable()
class StoreRequest {
  String name;
  String description;
  Map<String, String> legalDocument;

  Set<String>? tags;

  StoreRequest({
    required this.name,
    required this.description,
    required this.legalDocument,
  });

  Map<String, dynamic> toJson() => _$StoreRequestToJson(this);
}

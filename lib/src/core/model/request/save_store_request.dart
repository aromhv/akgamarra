import 'package:json_annotation/json_annotation.dart';

part 'save_store_request.g.dart';

@JsonSerializable()
class SaveStoreRequest {
  String name;
  String description;
  Map<String, String> legalDocument;

  Set<String>? tags;

  SaveStoreRequest({
    required this.name,
    required this.description,
    required this.legalDocument,
  });

  Map<String, dynamic> toJson() => _$SaveStoreRequestToJson(this);
}

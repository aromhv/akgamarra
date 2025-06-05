import 'package:json_annotation/json_annotation.dart';

part 'store_response.g.dart';

@JsonSerializable()
class StoreResponse {
  String id;
  String name;
  Set<String> tags;
  String ownerUser;
  String description;

  StoreResponse({required this.id, required this.name, required this.tags, required this.ownerUser, required this.description});

  factory StoreResponse.fromJson(Map<String, dynamic> json) => _$StoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);
}

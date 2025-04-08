import 'package:json_annotation/json_annotation.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
part 'role_response.g.dart';

@JsonSerializable()
class RoleResponse {
  final String id;
  final String name;
  final String alias;

  RoleResponse({required this.id, required this.name, required this.alias});

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoleResponseToJson(this);
}

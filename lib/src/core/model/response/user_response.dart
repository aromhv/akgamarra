import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String email;
  String alias;
  String picture;
  List<String> roles;

  String? storeId;
  String? lastName;
  String? firstName;
  String? numberPhone;
  String? documentType;
  String? documentNumber;

  UserResponse({
    required this.alias,
    required this.email,
    required this.picture,
    required this.roles,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

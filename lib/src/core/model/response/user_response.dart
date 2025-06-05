import 'package:akgamarra_app/src/core/model/response/navigation_response.dart';
import 'package:akgamarra_app/src/core/model/response/role_response.dart';
import 'package:akgamarra_app/src/core/model/response/store_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String email;
  String alias;
  String picture;
  bool verified;
  List<RoleResponse> roles;
  NavigationResponse navigation;

  String? lastName;
  String? firstName;
  String? numberPhone;
  String? documentType;
  String? documentNumber;
  StoreResponse? store;

  UserResponse({
    required this.alias,
    required this.email,
    required this.picture,
    required this.verified,
    required this.roles,
    required this.navigation,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

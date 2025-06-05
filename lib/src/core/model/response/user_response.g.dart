// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) =>
    UserResponse(
        alias: json['alias'] as String,
        email: json['email'] as String,
        picture: json['picture'] as String,
        verified: json['verified'] as bool,
        roles:
            (json['roles'] as List<dynamic>)
                .map((e) => RoleResponse.fromJson(e as Map<String, dynamic>))
                .toList(),
        navigation: NavigationResponse.fromJson(
          json['navigation'] as Map<String, dynamic>,
        ),
      )
      ..lastName = json['lastName'] as String?
      ..firstName = json['firstName'] as String?
      ..numberPhone = json['numberPhone'] as String?
      ..documentType = json['documentType'] as String?
      ..documentNumber = json['documentNumber'] as String?
      ..store =
          json['store'] == null
              ? null
              : StoreResponse.fromJson(json['store'] as Map<String, dynamic>);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'alias': instance.alias,
      'picture': instance.picture,
      'verified': instance.verified,
      'roles': instance.roles,
      'navigation': instance.navigation,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'numberPhone': instance.numberPhone,
      'documentType': instance.documentType,
      'documentNumber': instance.documentNumber,
      'store': instance.store,
    };

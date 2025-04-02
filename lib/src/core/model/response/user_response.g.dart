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
        roles:
            (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      )
      ..storeId = json['storeId'] as String?
      ..lastName = json['lastName'] as String?
      ..firstName = json['firstName'] as String?
      ..numberPhone = json['numberPhone'] as String?
      ..documentType = json['documentType'] as String?
      ..documentNumber = json['documentNumber'] as String?;

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'alias': instance.alias,
      'picture': instance.picture,
      'roles': instance.roles,
      'storeId': instance.storeId,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'numberPhone': instance.numberPhone,
      'documentType': instance.documentType,
      'documentNumber': instance.documentNumber,
    };

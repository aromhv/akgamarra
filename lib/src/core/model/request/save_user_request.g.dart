// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveUserRequest _$SaveUserRequestFromJson(Map<String, dynamic> json) =>
    SaveUserRequest(
      device: json['device'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      numberPhone: json['numberPhone'] as String,
      documentType: json['documentType'] as String,
      documentNumber: json['documentNumber'] as String,
    );

Map<String, dynamic> _$SaveUserRequestToJson(SaveUserRequest instance) =>
    <String, dynamic>{
      'device': instance.device,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'numberPhone': instance.numberPhone,
      'documentType': instance.documentType,
      'documentNumber': instance.documentNumber,
    };

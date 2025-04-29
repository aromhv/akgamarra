// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreRequest _$StoreRequestFromJson(Map<String, dynamic> json) => StoreRequest(
  name: json['name'] as String,
  description: json['description'] as String,
  legalDocument: Map<String, String>.from(json['legalDocument'] as Map),
)..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as String).toSet();

Map<String, dynamic> _$StoreRequestToJson(StoreRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'legalDocument': instance.legalDocument,
      'tags': instance.tags?.toList(),
    };

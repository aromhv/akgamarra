// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreRequest _$StoreRequestFromJson(Map<String, dynamic> json) => StoreRequest(
  name: json['name'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toSet(),
  description: json['description'] as String,
  legalDocument: Map<String, String>.from(json['legalDocument'] as Map),
);

Map<String, dynamic> _$StoreRequestToJson(StoreRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tags': instance.tags.toList(),
      'description': instance.description,
      'legalDocument': instance.legalDocument,
    };

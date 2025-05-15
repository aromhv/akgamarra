// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_store_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveStoreRequest _$SaveStoreRequestFromJson(Map<String, dynamic> json) =>
    SaveStoreRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      legalDocument: Map<String, String>.from(json['legalDocument'] as Map),
    )..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as String).toSet();

Map<String, dynamic> _$SaveStoreRequestToJson(SaveStoreRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'legalDocument': instance.legalDocument,
      'tags': instance.tags?.toList(),
    };

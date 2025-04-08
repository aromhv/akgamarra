// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) =>
    StoreResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toSet(),
      ownerUser: json['ownerUser'] as String,
      description: json['description'] as String,
      legalDocument: Map<String, String>.from(json['legalDocument'] as Map),
    );

Map<String, dynamic> _$StoreResponseToJson(StoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'tags': instance.tags.toList(),
      'ownerUser': instance.ownerUser,
      'description': instance.description,
      'legalDocument': instance.legalDocument,
    };

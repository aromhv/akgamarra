// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveProductRequest _$SaveProductRequestFromJson(Map<String, dynamic> json) =>
    SaveProductRequest(
      name: json['name'] as String,
      brand: json['brand'] as String,
      target: json['target'] as String,
      displayPrice: (json['displayPrice'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$SaveProductRequestToJson(SaveProductRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'target': instance.target,
      'displayPrice': instance.displayPrice,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'category': instance.category,
    };

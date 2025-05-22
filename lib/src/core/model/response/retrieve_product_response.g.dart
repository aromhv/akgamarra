// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrieveProductResponse _$RetrieveProductResponseFromJson(
  Map<String, dynamic> json,
) => RetrieveProductResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  target: json['target'] as String,
  category: json['category'] as String,
  imageUrl: json['imageUrl'] as String,
  brand: json['brand'] as String,
);

Map<String, dynamic> _$RetrieveProductResponseToJson(
  RetrieveProductResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'target': instance.target,
  'category': instance.category,
  'imageUrl': instance.imageUrl,
  'brand': instance.brand,
};

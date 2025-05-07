// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrieveProductRequest _$RetrieveProductRequestFromJson(
  Map<String, dynamic> json,
) => RetrieveProductRequest(
  page: (json['page'] as num).toInt(),
  brand: json['brand'] as String?,
  target: json['target'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$RetrieveProductRequestToJson(
  RetrieveProductRequest instance,
) => <String, dynamic>{
  'page': instance.page,
  'brand': instance.brand,
  'target': instance.target,
  'category': instance.category,
};

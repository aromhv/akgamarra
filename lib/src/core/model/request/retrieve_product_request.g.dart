// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrieveProductRequest _$RetrieveProductRequestFromJson(
  Map<String, dynamic> json,
) => RetrieveProductRequest(
  page: (json['page'] as num).toInt(),
  items: (json['items'] as num).toInt(),
  target: json['target'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$RetrieveProductRequestToJson(
  RetrieveProductRequest instance,
) => <String, dynamic>{
  'page': instance.page,
  'items': instance.items,
  'category': instance.category,
  'target': instance.target,
};

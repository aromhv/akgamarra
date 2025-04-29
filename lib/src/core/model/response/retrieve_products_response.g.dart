// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrieveProductsResponse _$RetrieveProductsResponseFromJson(
  Map<String, dynamic> json,
) => RetrieveProductsResponse(
    page: (json['page'] as num).toInt(),
    quantity: (json['quantity'] as num).toInt(),
  )
  ..products =
      (json['products'] as List<dynamic>?)
          ?.map(
            (e) => RetrieveProductResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();

Map<String, dynamic> _$RetrieveProductsResponseToJson(
  RetrieveProductsResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'quantity': instance.quantity,
  'products': instance.products,
};

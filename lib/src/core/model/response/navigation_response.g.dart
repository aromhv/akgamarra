// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationResponse _$NavigationResponseFromJson(Map<String, dynamic> json) =>
    NavigationResponse(
      bottomBarItems:
          (json['bottomBarItems'] as List<dynamic>)
              .map((e) => NavResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      sideBarItems:
          (json['sideBarItems'] as List<dynamic>)
              .map((e) => NavResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$NavigationResponseToJson(NavigationResponse instance) =>
    <String, dynamic>{
      'sideBarItems': instance.sideBarItems,
      'bottomBarItems': instance.bottomBarItems,
    };

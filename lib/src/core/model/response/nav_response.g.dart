// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavResponse _$NavResponseFromJson(Map<String, dynamic> json) => NavResponse(
  id: json['id'] as String,
  label: json['label'] as String,
  icon: json['icon'] as String,
)..route = json['route'] as String?;

Map<String, dynamic> _$NavResponseToJson(NavResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'icon': instance.icon,
      'route': instance.route,
    };

import 'package:json_annotation/json_annotation.dart';

part 'brand_response.g.dart';

@JsonSerializable()
class BrandResponse {
  String name;
  String icon;

  BrandResponse({required this.name, required this.icon});

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrandResponseToJson(this);
}

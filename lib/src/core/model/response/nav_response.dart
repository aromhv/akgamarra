import 'package:json_annotation/json_annotation.dart';

part 'nav_response.g.dart';

@JsonSerializable()
class NavResponse {
  String id;
  String label;
  String icon;
  String? route;

  NavResponse({required this.id, required this.label, required this.icon});

  factory NavResponse.fromJson(Map<String, dynamic> json) =>
      _$NavResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NavResponseToJson(this);
}

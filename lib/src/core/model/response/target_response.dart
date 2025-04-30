import 'package:json_annotation/json_annotation.dart';

part 'target_response.g.dart';

@JsonSerializable()
class TargetResponse {
  String key;
  String value;

  TargetResponse({required this.key, required this.value});

  factory TargetResponse.fromJson(Map<String, dynamic> json) =>
      _$TargetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TargetResponseToJson(this);
}

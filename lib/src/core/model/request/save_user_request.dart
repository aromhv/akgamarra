import 'package:json_annotation/json_annotation.dart';

part 'save_user_request.g.dart';

@JsonSerializable()
class SaveUserRequest {
  String device;
  String lastName;
  String firstName;
  String numberPhone;
  String documentType;
  String documentNumber;

  SaveUserRequest({
    required this.device,
    required this.lastName,
    required this.firstName,
    required this.numberPhone,
    required this.documentType,
    required this.documentNumber,
  });

  Map<String, dynamic> toJson() => _$SaveUserRequestToJson(this);
}

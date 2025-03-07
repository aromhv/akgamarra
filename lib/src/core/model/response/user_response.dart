class UserResponse {
  final String email;
  final String numberPhone;
  final String firstName;
  final String lastName;
  final String alias;
  final String documentType;
  final String documentNumber;
  final bool dataComplete;
  final List<String> roles;

  UserResponse({
    required this.email,
    required this.numberPhone,
    required this.firstName,
    required this.lastName,
    required this.alias,
    required this.documentType,
    required this.documentNumber,
    required this.dataComplete,
    required this.roles,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      email: json['email'],
      numberPhone: json['numberPhone'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      alias: json['alias'],
      documentType: json['documentType'],
      documentNumber: json['documentNumber'],
      dataComplete: json['dataComplete'],
      roles: List<String>.from(json['roles'] ?? []),
    );
  }
}

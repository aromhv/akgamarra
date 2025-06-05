import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;
  final String _urlBase = "http://69.197.164.187:8980/auth";

  AuthService({required this.dio});
}

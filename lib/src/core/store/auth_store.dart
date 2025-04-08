import 'package:akgamarra_app/src/core/model/response/user_response.dart';
import 'package:flutter/cupertino.dart';

class AuthStore extends ChangeNotifier {
  String? _token;
  UserResponse? _user;
  bool _isInitialized = false;

  String? get token => _token;

  UserResponse? get user => _user;

  bool get isInitialized => _isInitialized;

  void setSession(UserResponse user, String token) {
    _user = user;
    _token = token;
    notifyListeners();
  }

  void clear() {
    _user = null;
    _token = null;
    notifyListeners();
  }

  void markInitialized() {
    _isInitialized = true;
    notifyListeners();
  }
}

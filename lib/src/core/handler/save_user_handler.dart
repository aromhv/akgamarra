import 'dart:ffi';

import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/request/save_user_request.dart';
import 'package:akgamarra_app/src/core/service/auth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class SaveUserHandler {
  final AuthContext authState;
  final AuthService authService;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  SaveUserHandler(this.authState, this.authService);

  Future<Void?> save(SaveUserRequest request) async {
    isLoading.value = true;
    try {
      var token = authState.token;
      final fcmToken = await FirebaseMessaging.instance.getToken();
      request.device = fcmToken!;
      await authService.save(request, token!);
    } finally {
      isLoading.value = false;
    }
  }
}

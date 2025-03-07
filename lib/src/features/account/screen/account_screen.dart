import 'package:akgamarra_app/src/core/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginService>(
        builder: (context, authService, child) {
          return Center();
        },
      ),
    );
  }
}

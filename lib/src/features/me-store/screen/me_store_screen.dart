import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeStoreScreen extends StatelessWidget {
  const MeStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authContext = context.read<AuthContext>();
    final user = authContext.user;

    return Scaffold(body: Center(child: Text((user != null && user.store != null) ? user.store!.name : "")));
  }
}

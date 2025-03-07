import 'package:akgamarra_app/src/core/service/login_service.dart';
import 'package:akgamarra_app/src/features/auth/widget/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginService>(
        builder: (context, authService, child) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialMediaButton(
                  icon: FontAwesomeIcons.google,
                  buttonText: "Iniciar sesion con gmail",
                  color: Colors.red,
                  onPressed: () async {
                    await authService.signInWithGoogle();
                    context.go('/');
                  },
                ),
                SizedBox(height: 10),
                SocialMediaButton(
                  icon: FontAwesomeIcons.facebook,
                  buttonText: "Iniciar sesion con facebook",
                  color: Colors.blueAccent,
                  onPressed: () async {},
                ),
                SizedBox(height: 10),
                SocialMediaButton(
                  icon: FontAwesomeIcons.twitter,
                  buttonText: "Iniciar sesion con twitter",
                  color: Colors.black87,
                  onPressed: () async {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

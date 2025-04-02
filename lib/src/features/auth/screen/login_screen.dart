import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:akgamarra_app/src/features/auth/widget/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginHandler = context.read<LoginHandler>();

    singInSocialMedia(String service) async {
      final user = await loginHandler.signIn(service);
      if (user != null) {
        context.go('/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error al iniciar sesión con Google")),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SocialMediaButton(
              icon: FontAwesomeIcons.google,
              buttonText: "Iniciar sesión con Google",
              color: Colors.red,
              onPressed: () async {
                await singInSocialMedia("GOOGLE");
              },
            ),
            const SizedBox(height: 10),
            SocialMediaButton(
              icon: FontAwesomeIcons.facebook,
              buttonText: "Iniciar sesión con Facebook",
              color: Colors.blueAccent,
              onPressed: () async {
                await singInSocialMedia("GOOGLE");
              },
            ),
          ],
        ),
      ),
    );
  }
}

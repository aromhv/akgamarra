import 'package:akgamarra_app/src/core/enum/color_enum.dart';
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
        context.go('/sourcing');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error al iniciar sesión")));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Column(
            children: [
              Image.asset('assets/logo.jpg', height: 300),
              const SizedBox(height: 10),
              const Text("GAMARRA AKa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(80),
            decoration: BoxDecoration(
              color: ColorEnum.COLOR_PRINCIPAL.color,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                const Text("¡Bienvenido!", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                  "Para iniciar sesión usa tu cuenta de Google o cuenta de Facebook",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                SocialMediaButton(
                  icon: FontAwesomeIcons.google,
                  buttonText: "Usar Google",
                  color: Colors.black,
                  onPressed: () async {
                    await singInSocialMedia("GOOGLE");
                  },
                ),
                const SizedBox(height: 10),
                SocialMediaButton(
                  icon: FontAwesomeIcons.facebook,
                  buttonText: "Usar Facebook",
                  color: Colors.black,
                  onPressed: () async {
                    await singInSocialMedia("FACEBOOK");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

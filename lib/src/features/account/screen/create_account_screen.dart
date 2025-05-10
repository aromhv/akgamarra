import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Tipo de documento: ", style: const TextStyle(fontSize: 16)),
            Text("Numero de documento: ", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

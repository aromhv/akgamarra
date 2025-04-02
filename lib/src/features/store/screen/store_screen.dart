import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Mi tienda:", style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Crear producto"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Ver mis productos"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Ir al home"),
            ),
          ],
        ),
      ),
    );
  }
}

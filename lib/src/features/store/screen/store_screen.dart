import 'package:akgamarra_app/src/core/handler/store_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeHandler = context.read<StoreHandler>();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: storeHandler.findById(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error al cargar la tienda");
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Text("No se encontró la tienda");
            }

            final store = snapshot.data;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${store?.name}", style: TextStyle(fontSize: 30)),
                Text("${store?.description}", style: TextStyle(fontSize: 18)),
                ElevatedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text("Ir al home"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

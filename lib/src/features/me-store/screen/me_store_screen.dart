import 'package:akgamarra_app/src/core/handler/find_by_id_store_handler.dart';
import 'package:akgamarra_app/src/core/widget/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MeStoreScreen extends StatelessWidget {
  const MeStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final findByIdStoreHandler = context.read<FindByIdStoreHandler>();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: findByIdStoreHandler.findById(),
          builder: (context, snapshot) {
            final store = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressWidget();
            }
            if (snapshot.hasError) context.push("/");
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text("${store?.name}", style: TextStyle(fontSize: 30)), Text("${store?.description}", style: TextStyle(fontSize: 18))],
            );
          },
        ),
      ),
    );
  }
}

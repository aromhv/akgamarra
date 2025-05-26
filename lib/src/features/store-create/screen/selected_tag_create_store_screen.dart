import 'dart:collection';

import 'package:akgamarra_app/src/core/handler/current_user_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_tags_handler.dart';
import 'package:akgamarra_app/src/core/handler/save_store_handler.dart';
import 'package:akgamarra_app/src/core/model/request/save_store_request.dart';
import 'package:akgamarra_app/src/core/widget/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SelectedTagsCreateStoreScreen extends StatefulWidget {
  const SelectedTagsCreateStoreScreen({super.key});

  @override
  SelectedTagsCreateStoreScreenState createState() => SelectedTagsCreateStoreScreenState();
}

class SelectedTagsCreateStoreScreenState extends State<SelectedTagsCreateStoreScreen> {
  final Set<String> selectedTags = HashSet();

  @override
  Widget build(BuildContext context) {
    final storeHandler = context.read<SaveStoreHandler>();
    final loadCurrentUserHandler = context.read<CurrentUserHandler>();

    final state = GoRouterState.of(context);
    final SaveStoreRequest request = state.extra as SaveStoreRequest;

    return Scaffold(
      body: Center(
        child: FutureBuilder<Set<String>?>(
          future: context.read<RetrieveTagHandler>().retrieve(),
          builder: (cntx, snapshot) {
            final items = snapshot.data;
            if (items == null || items.isEmpty) {
              return Center(child: CircularProgressWidget());
            }
            if (snapshot.hasError) context.push("");

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children:
                        items.map((tag) {
                          return FilterChip(
                            label: Text(tag),
                            selected: selectedTags.contains(tag),
                            onSelected: (selected) {
                              setState(() {
                                selected ? selectedTags.add(tag) : selectedTags.remove(tag);
                              });
                            },
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        storeHandler.isSaving.value
                            ? null
                            : () async {
                              if (selectedTags.isNotEmpty) {
                                request.tags = selectedTags;

                                await storeHandler.save(request);
                                await loadCurrentUserHandler.loadSession();
                                context.go('/store');
                              }
                            },
                    child: ValueListenableBuilder<bool>(
                      valueListenable: storeHandler.isSaving,
                      builder: (context, isSaving, child) {
                        return isSaving
                            ? SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                            : Text('Guardar');
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

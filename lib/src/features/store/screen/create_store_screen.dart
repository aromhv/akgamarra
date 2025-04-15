import 'dart:collection';

import 'package:akgamarra_app/src/core/handler/load_current_user_handler.dart';
import 'package:akgamarra_app/src/core/handler/store_handler.dart';
import 'package:akgamarra_app/src/core/model/request/store_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateStoreScreen extends StatefulWidget {
  const CreateStoreScreen({super.key});

  @override
  MinimalStoreFormState createState() => MinimalStoreFormState();
}

class MinimalStoreFormState extends State<CreateStoreScreen> {
  final _formKey = GlobalKey<FormState>();

  String _selectedDocumentType = 'RUC';
  final List<String> _documentType = ['DNI', 'RUC'];

  final Set<String> _selectedTags = new HashSet();
  final List<String> _tags = ['Ropa', 'Deportes', 'Casual'];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _documentNumberController =
      TextEditingController();
  final TextEditingController _newTagController = TextEditingController();

  StoreRequest _buildStoreRequest() {
    Map<String, String> legalDocument = {
      "documentType": _selectedDocumentType,
      "documentNumber": _documentNumberController.text,
    };
    return StoreRequest(
      name: _nameController.text,
      tags: _selectedTags,
      description: _descriptionController.text,
      legalDocument: legalDocument,
    );
  }

  void _addTag() {
    final newTag = _newTagController.text.trim();
    if (newTag.isNotEmpty && !_tags.contains(newTag)) {
      setState(() {
        _tags.add(newTag);
        _selectedTags.add(newTag);
      });
    }
    _newTagController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final storeHandler = context.read<StoreHandler>();
    final loadCurrentUserHandler = context.read<LoadCurrentUserHandler>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              Wrap(
                spacing: 8.0,
                children:
                    _tags.map((tag) {
                      return FilterChip(
                        label: Text(tag),
                        selected: _selectedTags.contains(tag),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedTags.add(tag)
                                : _selectedTags.remove(tag);
                          });
                        },
                      );
                    }).toList(),
              ),
              TextField(
                controller: _newTagController,
                decoration: InputDecoration(
                  labelText: 'Agregar nuevo tag',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addTag,
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Tipo de documento'),
                value: _selectedDocumentType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedDocumentType = newValue!;
                  });
                },
                items:
                    _documentType.map((tag) {
                      return DropdownMenuItem(value: tag, child: Text(tag));
                    }).toList(),
              ),
              TextFormField(
                controller: _documentNumberController,
                decoration: InputDecoration(labelText: 'Número de documento'),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    storeHandler.isSaving.value
                        ? null
                        : () async {
                          if (_formKey.currentState!.validate()) {
                            await storeHandler.save(_buildStoreRequest());
                            if (!storeHandler.isSaving.value) {
                              await loadCurrentUserHandler.loadUser();
                              context.go('/');
                            }
                          }
                        },
                child: ValueListenableBuilder<bool>(
                  valueListenable: storeHandler.isSaving,
                  builder: (context, isSaving, child) {
                    return isSaving
                        ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                        : Text('Guardar');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

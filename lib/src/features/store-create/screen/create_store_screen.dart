import 'package:akgamarra_app/src/core/model/request/save_store_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateStoreScreen extends StatefulWidget {
  const CreateStoreScreen({super.key});

  @override
  CreateStoreScreenState createState() => CreateStoreScreenState();
}

class CreateStoreScreenState extends State<CreateStoreScreen> {
  final _formKey = GlobalKey<FormState>();

  String _selectedDocumentType = 'RUC';
  final List<String> _documentType = ['DNI', 'RUC'];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _documentNumberController =
      TextEditingController();

  SaveStoreRequest _buildStoreRequest() {
    Map<String, String> legalDocument = {
      "documentType": _selectedDocumentType,
      "documentNumber": _documentNumberController.text,
    };
    return SaveStoreRequest(
      name: _nameController.text,
      description: _descriptionController.text,
      legalDocument: legalDocument,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context.push(
                      '/store-create/select-tags',
                      extra: _buildStoreRequest(),
                    );
                  }
                },
                child: Text('Contiuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

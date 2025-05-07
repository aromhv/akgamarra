import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumberWidget extends StatelessWidget {
  final Icon? icon;
  final String labelText;
  final TextEditingController controller;

  const InputNumberWidget({
    super.key,
    this.icon,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(labelText: labelText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obligatorio';
        }
        if (double.tryParse(value) == null) {
          return 'Debe ser un número válido';
        }
        return null;
      },
    );
  }
}

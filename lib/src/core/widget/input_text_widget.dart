import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final Icon? icon;
  final bool enabled;
  final String labelText;
  final TextEditingController controller;

  const InputTextWidget({
    super.key,
    this.icon,
    required this.enabled,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: (value) => value!.isEmpty ? 'Requerido' : null,
    );
  }
}

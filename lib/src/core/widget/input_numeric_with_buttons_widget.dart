import 'package:flutter/material.dart';

class InputNumericWithButtonsWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const InputNumericWithButtonsWidget({super.key, required this.labelText, required this.controller});

  void _changeValue(int delta) {
    final current = int.tryParse(controller.text) ?? 0;
    controller.text = (current + delta).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            enabled: false,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: labelText,
              border: const OutlineInputBorder(),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Ingrese un número';
              if (int.tryParse(value) == null) return 'Número inválido';
              return null;
            },
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(8), minimumSize: const Size(36, 36)),
              onPressed: () => _changeValue(1),
              child: const Icon(Icons.add, size: 16),
            ),
            const SizedBox(height: 4),
            OutlinedButton(
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(8), minimumSize: const Size(36, 36)),
              onPressed: () => _changeValue(-1),
              child: const Icon(Icons.remove, size: 16),
            ),
          ],
        ),
      ],
    );
  }
}

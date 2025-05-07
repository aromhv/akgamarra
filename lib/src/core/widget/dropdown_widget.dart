import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final void Function(String?) onChanged;

  const DropdownWidget({
    required this.title,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: title),
      onChanged: onChanged,
      items:
          items.map((item) {
            return DropdownMenuItem(
              value: item["key"],
              child: Text(item["value"]!),
            );
          }).toList(),
    );
  }
}

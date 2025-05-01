import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String title;
  final List<String> items;
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
      value: (items.isEmpty) ? null : items[0],
      onChanged: onChanged,
      items:
          items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
    );
  }
}

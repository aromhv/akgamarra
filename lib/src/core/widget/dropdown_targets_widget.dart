import 'package:akgamarra_app/src/core/model/response/target_response.dart';
import 'package:flutter/material.dart';

class DropdownTargetsWidget extends StatelessWidget {
  final List<TargetResponse>? targets;
  final void Function(String?) onChanged;

  const DropdownTargetsWidget({
    required this.targets,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: 'Seleciona la el genero'),
      value: targets?[0].key,
      onChanged: onChanged,
      items:
          targets?.map((brand) {
            return DropdownMenuItem(value: brand.key, child: Text(brand.value));
          }).toList(),
    );
  }
}

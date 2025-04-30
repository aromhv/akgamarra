import 'package:akgamarra_app/src/core/model/response/brand_response.dart';
import 'package:flutter/material.dart';

class DropdownBrandsWidget extends StatelessWidget {
  final List<BrandResponse>? brands;
  final void Function(String?) onChanged;

  const DropdownBrandsWidget({
    required this.brands,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: 'Seleciona la marca'),
      value: brands?[0].name,
      onChanged: onChanged,
      items:
          brands?.map((brand) {
            return DropdownMenuItem(value: brand.name, child: Text(brand.name));
          }).toList(),
    );
  }
}

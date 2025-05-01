import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/model/response/brand_response.dart';
import 'package:akgamarra_app/src/core/model/response/category_response.dart';
import 'package:akgamarra_app/src/core/model/response/target_response.dart';
import 'package:akgamarra_app/src/core/widget/dropdown_widget.dart';
import 'package:flutter/material.dart';

/*
* ToDo: Los filtros estan mejor en un modal.
* */
class FilterProductsWidget extends StatelessWidget {
  final List<BrandResponse> brands;
  final List<TargetResponse> targets;
  final List<CategoryResponse> categories;
  final bool loadingCategories;
  final void Function(String?) onChangedBrand;
  final void Function(String?) onChangedTarget;
  final void Function(String?) onChangedCategories;

  const FilterProductsWidget({
    super.key,
    required this.brands,
    required this.targets,
    required this.categories,
    required this.loadingCategories,
    required this.onChangedBrand,
    required this.onChangedTarget,
    required this.onChangedCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Container(
          color: ColorEnum.COLOR_UNSELECTED.color,
          child: Column(
            children: [
              DropdownWidget(
                title: "Selecciona una marca",
                items: brands.map((BrandResponse item) => item.name).toList(),
                onChanged: onChangedBrand,
              ),
              DropdownWidget(
                title: "Selecciona un genero",
                items:
                    targets.map((TargetResponse item) => item.value).toList(),
                onChanged: onChangedTarget,
              ),
              loadingCategories
                  ? const CircularProgressIndicator()
                  : DropdownWidget(
                    title: "Selecciona una categoria",
                    items:
                        categories
                            .map((CategoryResponse item) => item.name)
                            .toList(),
                    onChanged: onChangedCategories,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

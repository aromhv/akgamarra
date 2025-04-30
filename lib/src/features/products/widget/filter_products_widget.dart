import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/model/response/brand_response.dart';
import 'package:akgamarra_app/src/core/model/response/target_response.dart';
import 'package:akgamarra_app/src/core/widget/dropdown_brands_widget.dart';
import 'package:akgamarra_app/src/core/widget/dropdown_targets_widget.dart';
import 'package:flutter/material.dart';

class FilterProductsWidget extends StatelessWidget {
  final List<BrandResponse>? brands;
  final List<TargetResponse>? targets;
  final void Function(String?) onChangedBrand;
  final void Function(String?) onChangedTarget;

  const FilterProductsWidget({
    super.key,
    required this.brands,
    required this.targets,

    required this.onChangedBrand,
    required this.onChangedTarget,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Container(
          color: ColorEnum.COLOR_UNSELECTED.color,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                DropdownBrandsWidget(brands: brands, onChanged: onChangedBrand),
                DropdownTargetsWidget(
                  targets: targets,
                  onChanged: onChangedTarget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:akgamarra_app/src/core/handler/retrieve_brands_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_categories_handler.dart';
import 'package:akgamarra_app/src/core/handler/retrieve_targets_handler.dart';
import 'package:akgamarra_app/src/core/model/dto/product_filter_dto.dart';
import 'package:akgamarra_app/src/core/model/response/brand_response.dart';
import 'package:akgamarra_app/src/core/model/response/category_response.dart';
import 'package:akgamarra_app/src/core/model/response/target_response.dart';
import 'package:akgamarra_app/src/core/widget/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterProductsModalWidget extends StatefulWidget {
  final void Function(ProductFilterDto) onChanged;

  const FilterProductsModalWidget({super.key, required this.onChanged});

  @override
  State<FilterProductsModalWidget> createState() => FilterProductsModalWidgetState();
}

class FilterProductsModalWidgetState extends State<FilterProductsModalWidget> {
  bool _isLoadingCategories = false;

  String _selectedBrand = "";
  String _selectedTarget = "";
  String _selectedCategory = "";

  List<BrandResponse> _brands = [];
  List<TargetResponse> _targets = [];
  List<CategoryResponse> _categories = [];

  late final RetrieveBrandsHandler _retrieveBrandsHandler;
  late final RetrieveTargetsHandler _retrieveTargetsHandler;
  late final RetrieveCategoriesHandler _retrieveCategoriesHandler;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _retrieveBrandsHandler = context.read<RetrieveBrandsHandler>();
    _retrieveTargetsHandler = context.read<RetrieveTargetsHandler>();
    _retrieveCategoriesHandler = context.read<RetrieveCategoriesHandler>();

    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final brands = await _retrieveBrandsHandler.retrieve();
    final targets = await _retrieveTargetsHandler.retrieve();
    setState(() {
      _brands = brands;
      _targets = targets;
    });
  }

  Future<void> _onTargetChanged(String? targetId) async {
    setState(() {
      _isLoadingCategories = true;
      _categories = [];
    });

    final categories = await _retrieveCategoriesHandler.retrieve(targetId);
    setState(() {
      _categories = categories;
      _isLoadingCategories = false;
    });
  }

  ProductFilterDto get currentFilter => ProductFilterDto(brand: _selectedBrand, target: _selectedTarget, category: _selectedCategory);

  void _emitChanges() {
    widget.onChanged(currentFilter);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DropdownWidget(
              title: "Selecciona una marca",
              items: _brands.map((BrandResponse item) => item.toMap()).toList(),
              onChanged: (brand) {
                setState(() {
                  _selectedBrand = brand!;
                });
                _emitChanges();
              },
            ),
            DropdownWidget(
              title: "Selecciona un genero",
              items: _targets.map((TargetResponse item) => item.toMap()).toList(),
              onChanged: (target) {
                setState(() {
                  _selectedTarget = target!;
                });
                _onTargetChanged(target);
                _emitChanges();
              },
            ),
            _isLoadingCategories
                ? const CircularProgressIndicator()
                : DropdownWidget(
                  title: "Selecciona una categoria",
                  items: _categories.map((CategoryResponse item) => item.toMap()).toList(),
                  onChanged: (category) {
                    setState(() {
                      _selectedCategory = category!;
                    });
                    _emitChanges();
                  },
                ),
          ],
        ),
      ),
    );
  }
}

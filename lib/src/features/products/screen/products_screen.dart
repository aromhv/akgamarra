import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

/*
* ToDo: Que se enfoque solo en mostrar y paginar productos
* ToDo: Boton para mostrar los filtros de busqueda... boton para ir a la pagina de creacion de productos.
* */
class _ProductsScreenState extends State<ProductsScreen> {
  /*
  late final RetrieveBrandsHandler _retrieveBrandsHandler;
  late final RetrieveTargetsHandler _retrieveTargetsHandler;
  late final RetrieveCategoriesHandler _retrieveCategoriesHandler;

  List<BrandResponse> _brands = [];
  List<TargetResponse> _targets = [];
  List<CategoryResponse> _categories = [];

  bool _isLoadingCategories = false;

  final bool _isLoadingInitial = true;
   */

  /*
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
      _isLoadingInitial = false;
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
   */

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      " xd",
      "a",
      "dsdsds",
      "Ddddddddddd",
      "xxwxww",
      "1",
      "2",
      "3",
    ];

    return Stack(
      children: [
        Container(
          color: ColorEnum.COLOR_SELECTED.color,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      children: items.map(_buildItem).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Row(
            children: [
              FloatingActionButton(
                backgroundColor: ColorEnum.COLOR_SELECTED.color,
                heroTag: "btn1",
                onPressed: () {},
                child: IconEnum.ICON_SEARCH.icon,
              ),
              const SizedBox(width: 12),
              FloatingActionButton(
                backgroundColor: ColorEnum.COLOR_SELECTED.color,
                heroTag: "btn2",
                onPressed: () {},
                child: IconEnum.ICON_ADD.icon,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(String item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        item,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

/*
Expanded(
                    flex: 3,
                    child: FilterProductsWidget(
                      brands: _brands,
                      targets: _targets,
                      categories: _categories,
                      loadingCategories: _isLoadingCategories,
                      onChangedBrand: (brand) => {},
                      onChangedCategories: (cat) => {},
                      onChangedTarget: _onTargetChanged,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(child: Text("Crear un nuevo producto")),
                  ),
 */

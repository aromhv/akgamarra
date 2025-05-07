import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/handler/create_products_handler.dart';
import 'package:akgamarra_app/src/core/model/request/save_product_request.dart';
import 'package:akgamarra_app/src/core/widget/input_number_widget.dart';
import 'package:akgamarra_app/src/core/widget/input_text_widget.dart';
import 'package:akgamarra_app/src/core/widget/modal/modal_utils.dart';
import 'package:akgamarra_app/src/features/products/widget/buttons_create_product_widget.dart';
import 'package:akgamarra_app/src/features/products/widget/modal/filter_products_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateProductsScreen extends StatefulWidget {
  const CreateProductsScreen({super.key});

  @override
  State<CreateProductsScreen> createState() => _CreateProductsScreenState();
}

class _CreateProductsScreenState extends State<CreateProductsScreen> {
  final double _defaultItemsSpace = 12.5;
  final _formKey = GlobalKey<FormState>();

  SaveProductRequest request = SaveProductRequest(
    name: "",
    brand: "",
    target: "",
    displayPrice: 0,
    imageUrl: "any",
    description: "",
    category: "",
  );

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _displayPriceController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final createProductsHandler = context.read<CreateProductsHandler>();

    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            color: ColorEnum.COLOR_SELECTED.color,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      enabled: true,
                      labelText: 'Nombre',
                      controller: _nameController,
                    ),
                    SizedBox(height: _defaultItemsSpace),
                    TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(labelText: 'Descripcion'),
                      validator: (value) => value!.isEmpty ? 'Requerido' : null,
                    ),
                    SizedBox(height: _defaultItemsSpace),
                    InputNumberWidget(
                      labelText: "Precio a mostrar",
                      controller: _displayPriceController,
                    ),
                    SizedBox(height: _defaultItemsSpace),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextWidget(
                            enabled: false,
                            labelText: 'Marca',
                            controller: _brandController,
                          ),
                        ),
                        Expanded(
                          child: InputTextWidget(
                            enabled: false,
                            labelText: 'Género',
                            controller: _targetController,
                          ),
                        ),
                        Expanded(
                          child: InputTextWidget(
                            enabled: false,
                            labelText: 'Categoría',
                            controller: _categoryController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _defaultItemsSpace),
                    ValueListenableBuilder<bool>(
                      valueListenable: createProductsHandler.isLoading,
                      builder: (context, isLoading, _) {
                        if (isLoading) {
                          return SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: ColorEnum.COLOR_PRINCIPAL.color,
                              strokeWidth: 2,
                            ),
                          );
                        }

                        return ButtonsCreateProductWidget(
                          onPressedTargets: () async {
                            await showFilteredModal();
                          },
                          onPressedImage: () async {},
                          onPressedSave: () async {
                            if (isLoading) return;
                            setRequestCreateProduct();
                            await createProductsHandler.create(request);
                            context.push("/products");
                          },
                          defaultItemsSpace: _defaultItemsSpace,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  showFilteredModal() {
    setState(() {
      clearTargetsRequest();
      clearTargetsForm();
    });
    showCustomModal(
      context: context,
      title: 'Busqueda de productos',
      content: FilterProductsModalWidget(
        onChanged: (filters) {
          setState(() {
            request.brand = filters.brand;
            request.target = filters.target;
            request.category = filters.category;

            _brandController.text = request.brand;
            _targetController.text = request.target;
            _categoryController.text = request.category;
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (request.isValid()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }

  setRequestCreateProduct() {
    request.name = _nameController.text;
    request.brand = _brandController.text;
    request.target = _targetController.text;
    request.category = _categoryController.text;
    request.description = _descriptionController.text;
    request.displayPrice = double.parse(_displayPriceController.text);
  }

  clearTargetsRequest() {
    request.brand = "";
    request.target = "";
    request.category = "";
  }

  clearTargetsForm() {
    _brandController.text = "";
    _targetController.text = "";
    _categoryController.text = "";
  }
}

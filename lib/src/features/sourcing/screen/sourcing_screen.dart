import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/widget/button_widget.dart';
import 'package:akgamarra_app/src/core/widget/input_numeric_with_buttons_widget.dart';
import 'package:akgamarra_app/src/core/widget/input_text_widget.dart';
import 'package:flutter/material.dart';

class SourcingScreen extends StatefulWidget {
  const SourcingScreen({super.key});

  @override
  State<SourcingScreen> createState() => _SourcingScreen();
}

class _SourcingScreen extends State<SourcingScreen> {
  final double _defaultItemsSpace = 12.5;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputTextWidget(enabled: true, labelText: 'Nombre', controller: _nameController),
                  SizedBox(height: _defaultItemsSpace),
                  InputTextWidget(enabled: true, labelText: 'Marca', controller: _brandController),
                  SizedBox(height: _defaultItemsSpace),
                  InputTextWidget(enabled: true, labelText: 'Categoria', controller: _categoryController),
                  SizedBox(height: _defaultItemsSpace),
                  InputTextWidget(enabled: true, labelText: 'Genero', controller: _targetController),
                  SizedBox(height: _defaultItemsSpace),
                  InputNumericWithButtonsWidget(labelText: 'Cantidad', controller: _quantityController),
                  SizedBox(height: _defaultItemsSpace),
                  ButtonWidget(
                    onPressed: () async => {},
                    icon: IconEnum.ICON_SOURCING.icon,
                    iconColor: ColorEnum.COLOR_SELECTED.color,
                    buttonColor: ColorEnum.COLOR_PRINCIPAL.color,
                    labelColor: ColorEnum.COLOR_SELECTED.color,
                    label: "Selecionar etiquetas",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/widget/button_widget.dart';
import 'package:flutter/material.dart';

class ButtonsCreateProductWidget extends StatelessWidget {
  final double defaultItemsSpace;
  final VoidCallback onPressedTargets;
  final VoidCallback onPressedImage;
  final VoidCallback onPressedSave;

  const ButtonsCreateProductWidget({
    super.key,
    required this.defaultItemsSpace,
    required this.onPressedTargets,
    required this.onPressedImage,
    required this.onPressedSave,
  });

  List<Widget> _buttonsForForm() {
    return [
      Row(
        children: [
          Expanded(
            child: ButtonWidget(
              onPressed: () async => onPressedTargets(),
              icon: IconEnum.ICON_CATEGORY.icon,
              iconColor: ColorEnum.COLOR_PRINCIPAL.color,
              buttonColor: ColorEnum.COLOR_SELECTED.color,
              labelColor: ColorEnum.COLOR_PRINCIPAL.color,
              label: "Selecionar etiquetas",
            ),
          ),
          SizedBox(width: defaultItemsSpace),
          Expanded(
            child: ButtonWidget(
              onPressed: () => onPressedImage(),
              icon: IconEnum.ICON_PHOTO.icon,
              iconColor: ColorEnum.COLOR_PRINCIPAL.color,
              buttonColor: ColorEnum.COLOR_SELECTED.color,
              labelColor: ColorEnum.COLOR_PRINCIPAL.color,
              label: "Selecionar imagen principal",
            ),
          ),
        ],
      ),
      SizedBox(height: defaultItemsSpace),
      ButtonWidget(
        onPressed: () => onPressedSave(),
        icon: IconEnum.ICON_ADD.icon,
        iconColor: ColorEnum.COLOR_SELECTED.color,
        buttonColor: ColorEnum.COLOR_PRINCIPAL.color,
        labelColor: ColorEnum.COLOR_SELECTED.color,
        label: "Guardar mi producto",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buttonsForForm());
  }
}

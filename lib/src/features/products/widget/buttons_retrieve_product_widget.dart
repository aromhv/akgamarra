import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:flutter/material.dart';

class ButtonsRetrieveProductWidget extends StatelessWidget {
  final VoidCallback onPressedSearch;
  final VoidCallback onPressedCreateScreen;

  const ButtonsRetrieveProductWidget({super.key, required this.onPressedSearch, required this.onPressedCreateScreen});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Row(
        children: [
          FloatingActionButton(
            backgroundColor: ColorEnum.COLOR_SELECTED.color,
            heroTag: "btn1",
            onPressed: () => onPressedSearch(),
            child: IconEnum.ICON_SEARCH.icon,
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            backgroundColor: ColorEnum.COLOR_SELECTED.color,
            heroTag: "btn2",
            onPressed: () => onPressedCreateScreen(),
            child: IconEnum.ICON_ADD.icon,
          ),
        ],
      ),
    );
  }
}

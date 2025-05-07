import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 50, height: 50, child: CircularProgressIndicator(color: ColorEnum.COLOR_PRINCIPAL.color, strokeWidth: 5));
  }
}

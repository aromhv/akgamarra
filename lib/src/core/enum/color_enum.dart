import 'package:flutter/material.dart';

enum ColorEnum {
  COLOR_PRINCIPAL("principal", Color(0xFF650FED)),
  COLOR_UNSELECTED("unselected", Colors.grey),
  COLOR_SELECTED("selected", Colors.white);

  final String name;
  final Color color;

  const ColorEnum(this.name, this.color);
}

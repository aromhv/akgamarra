import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final List<NavResponse> bottomNavItems;

  const BottomBarWidget({
    super.key,
    required this.bottomNavItems,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem toItem(NavResponse nav) {
      return BottomNavigationBarItem(
        label: nav.label,
        icon: IconEnum.findIconByName(nav.icon),
        backgroundColor: ColorEnum.COLOR_PRINCIPAL.color,
      );
    }

    return BottomNavigationBar(
      onTap: onItemTapped,
      currentIndex: currentIndex,
      items: bottomNavItems.map((nav) => toItem(nav)).toList(),
    );
  }
}

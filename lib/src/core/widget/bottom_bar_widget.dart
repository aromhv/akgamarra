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
        backgroundColor: ColorEnum.COLOR_PRINCIPAL.color,
        icon: IconEnum.findIconByName(nav.icon),
      );
    }

    return BottomNavigationBar(
      backgroundColor: ColorEnum.COLOR_PRINCIPAL.color,
      selectedItemColor: ColorEnum.COLOR_SELECTED.color,
      unselectedItemColor: ColorEnum.COLOR_UNSELECTED.color,
      onTap: onItemTapped,
      currentIndex: currentIndex,
      items: bottomNavItems.map((nav) => toItem(nav)).toList(),
    );
  }
}

import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget implements PreferredSizeWidget {
  List<NavResponse> sideBarItems = [];

  DrawerWidget({super.key, required this.sideBarItems});

  @override
  Widget build(BuildContext context) {
    final loginService = context.read<LoginHandler>();

    void onItemTappedSideBar(NavResponse navResponse) async {
      String? route = navResponse.route;
      if (route != null) {
        context.go(route);
      } else {
        await loginService.signOut();
        context.go('/login');
      }
    }

    ListTile toItem(NavResponse nav) {
      return ListTile(
        title: Text(nav.label),
        onTap: () => onItemTappedSideBar(nav),
        leading: IconEnum.findIconByName(nav.icon),
      );
    }

    return Drawer(
      child: ListView(
        children: sideBarItems.map((nav) => toItem(nav)).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}

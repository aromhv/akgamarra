import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthContext>();

    final user = authState.user;

    List<NavResponse> bottomNavItems = [];
    if (user != null) bottomNavItems = user.navigation.bottomBarItems;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
      context.go(bottomNavItems[index].route!);
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items:
            bottomNavItems.map((item) {
              return BottomNavigationBarItem(
                label: item.label,
                icon: IconEnum.findIconByName(item.icon),
              );
            }).toList(),
      ),
    );
  }
}

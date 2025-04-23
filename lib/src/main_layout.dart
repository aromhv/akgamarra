import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/enum/color_enum.dart';
import 'package:akgamarra_app/src/core/enum/icon_enum.dart';
import 'package:akgamarra_app/src/core/handler/login_handler.dart';
import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final authContext = context.watch<AuthContext>();
    final loginService = context.read<LoginHandler>();
    final user = authContext.user;

    List<NavResponse> sideBarItems = [];
    List<NavResponse> bottomNavItems = [];
    if (user != null) {
      sideBarItems = user.navigation.sideBarItems;
      bottomNavItems = user.navigation.bottomBarItems;
    }

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
      context.go(bottomNavItems[index].route!);
    }

    void onItemTappedSideBar(NavResponse navResponse) async {
      String? route = navResponse.route;
      if (route != null) {
        context.go(route);
      } else {
        await loginService.signOut();
        context.go('/login');
      }
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorEnum.COLOR_PRINCIPAL.color,
          title: const Text("AK Gamarra"),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
          ),
          child: widget.child,
        ),
        drawer: Drawer(
          child: ListView(
            children:
                sideBarItems
                    .map(
                      (item) => ListTile(
                        leading: IconEnum.findIconByName(item.icon),
                        title: Text(item.label),
                        onTap: () => onItemTappedSideBar(item),
                      ),
                    )
                    .toList(),
          ),
        ),
        bottomNavigationBar:
            bottomNavItems.isEmpty
                ? null
                : BottomNavigationBar(
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
      ),
    );
  }
}

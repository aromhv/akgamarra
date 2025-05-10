import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:akgamarra_app/src/core/widget/bottom_bar_widget.dart';
import 'package:akgamarra_app/src/core/widget/drawer_widget.dart';
import 'package:akgamarra_app/src/core/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomBarLayout extends StatefulWidget {
  final Widget child;

  const BottomBarLayout({super.key, required this.child});

  @override
  BottomBarLayoutState createState() => BottomBarLayoutState();
}

class BottomBarLayoutState extends State<BottomBarLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final authContext = context.watch<AuthContext>();
    final user = authContext.user;

    List<NavResponse> sideBarItems = [];
    List<NavResponse> bottomNavItems = [];
    if (user != null) {
      sideBarItems = user.navigation.sideBarItems;
      bottomNavItems = user.navigation.bottomBarItems;
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HeaderWidget(),
        body: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
          ),
          child: widget.child,
        ),
        endDrawer:
            sideBarItems.isEmpty
                ? null
                : DrawerWidget(sideBarItems: sideBarItems),
        bottomNavigationBar:
            bottomNavItems.isEmpty
                ? null
                : BottomBarWidget(
                  bottomNavItems: bottomNavItems,
                  currentIndex: _currentIndex,
                  onItemTapped: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    context.go(bottomNavItems[index].route!);
                  },
                ),
      ),
    );
  }
}

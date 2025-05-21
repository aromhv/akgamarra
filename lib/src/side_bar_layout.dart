import 'package:akgamarra_app/src/core/context/auth_context.dart';
import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:akgamarra_app/src/core/widget/drawer_widget.dart';
import 'package:akgamarra_app/src/core/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SideBarLayout extends StatefulWidget {
  final Widget child;

  const SideBarLayout({super.key, required this.child});

  @override
  SideBarLayoutState createState() => SideBarLayoutState();
}

class SideBarLayoutState extends State<SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));

    final authContext = context.watch<AuthContext>();
    final user = authContext.user;

    List<NavResponse> sideBarItems = [];
    if (user != null) sideBarItems = user.navigation.sideBarItems;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HeaderWidget(),
        body: Container(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight), child: widget.child),
        endDrawer: sideBarItems.isEmpty ? null : DrawerWidget(sideBarItems: sideBarItems),
      ),
    );
  }
}

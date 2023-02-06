import '../../globals.dart' as globals;
import 'package:connected_android/widgets/drawer/login_menu.dart';
import 'package:connected_android/widgets/drawer/user_menu.dart';
import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    Widget page;
    if (globals.isLoggedIn) {
      page = const UserMenu();
    } else {
      page = const LoginMenu();
    }
    return LayoutBuilder(builder: (context, constraint) {
      return Drawer(child: page);
    });
  }
}
import 'package:flutter/material.dart';
import 'package:connected_android/pages/login.dart';
import 'package:connected_android/pages/register.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool switchScreen = true;
  void togScreen() {
    setState(() {
      switchScreen = !switchScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(switchScreen) {
      return Login(togScreen : togScreen);
    }
    return Register(togSreen : togScreen);
  }
}

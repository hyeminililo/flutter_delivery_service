import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/common/view/splash_screen.dart';
import 'package:flutter_delivery_app/user/view/login_screen.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'NotoSans'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}

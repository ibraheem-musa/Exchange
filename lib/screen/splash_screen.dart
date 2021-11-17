// ignore_for_file: prefer_const_constructors

import 'package:exchange/colors.dart';
import 'package:exchange/screen/home_screen.dart';
import 'package:exchange/screen/login_screen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: const LoginScreen(),
        title: Text(
          "Exchange",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: ColorForDesign().green),
        ),
        image: Image.asset('assets/LOGOexchange.jpg',
            height: MediaQuery.of(context).size.height / 3),
        backgroundColor: ColorForDesign().white,
        photoSize: 200.0,
        loaderColor: Color(0xffbf942e));
  }
}

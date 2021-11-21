// ignore_for_file: prefer_const_constructors

import 'package:exchange/colors.dart';
import 'package:exchange/screen/Donation_screens/donation_screen.dart';
import 'package:exchange/screen/Exchang_screens/exchang_screen_forall.dart';
import 'package:exchange/screen/supsatogry_screen.dart';
import 'package:exchange/widgets/exchang_for_nv_bar/exchange_for_all.dart';
import 'package:exchange/screen/home_screen.dart';
import 'package:exchange/screen/login_screen.dart';
import 'package:exchange/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: {
        nameroute.nameRouote_HomeScreen: (ctx) => HomeScreen(),
        nameroute.nameRouote_Loginscreen: (ctx) => LoginScreen(),
        nameroute.nameRouote_ExchangeScreen: (ctx) => ExchangeScreen(),
        nameroute.nameRouote_ExChangForAll: (ctx) => ExChangForAll(),
        nameroute.nameRouote_SupCattogryScreen: (ctx) => SupCattogryScreen(),
        nameroute.nameRouote_DonationScreen: (ctx) => DonationScreen(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorForDesign().darkyellow),
        ),
        primarySwatch: Colors.green,
        primaryTextTheme:
            TextTheme(headline6: TextStyle(color: ColorForDesign.black)),
      ),
    );
  }
}

// ignore: camel_case_types
class nameroute {
  // ignore: constant_identifier_names
  static const nameRouote_HomeScreen = '/HomeScreen';
  // ignore: constant_identifier_names
  static const nameRouote_ExchangeScreen = '/ExchangeScreen';
  // ignore: constant_identifier_names
  static const nameRouote_Loginscreen = '/Loginscreen';
  static const nameRouote_ExChangForAll = '/ExChangForAll';
  static const nameRouote_SupCattogryScreen = '/SupCattogryScreen';
  static const nameRouote_DonationScreen = '/DonationScreen';
}

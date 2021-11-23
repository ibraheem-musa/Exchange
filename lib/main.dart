import 'package:exchange/colors.dart';
import 'package:exchange/loclaization.dart';
import 'package:exchange/screen/Donation_screens/donation_screen.dart';
import 'package:exchange/screen/Exchang_screens/exchang_screen_forall.dart';
import 'package:exchange/screen/details.dart';
import 'package:exchange/screen/supcatogry_screen.dart';
import 'package:exchange/widgets/exchang_for_nv_bar/exchange_for_all.dart';
import 'package:exchange/screen/home_screen.dart';
import 'package:exchange/screen/login_screen.dart';
import 'package:exchange/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale local in supportLang) {
            if (local.languageCode == currentLang.languageCode) {
              sharedPreferences.setString("lang", currentLang.languageCode);
              print(currentLang.languageCode);
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
      locale: _locale,
      home: Splashscreen(),
      routes: {
        nameroute.nameRouote_HomeScreen: (ctx) => HomeScreen(),
        nameroute.nameRouote_Loginscreen: (ctx) => LoginScreen(),
        nameroute.nameRouote_ExchangeScreen: (ctx) => ExchangeScreen(),
        nameroute.nameRouote_ExChangForAll: (ctx) => ExChangForAll(),
        nameroute.nameRouote_SupCattogryScreen: (ctx) => SupCattogryScreen(),
        nameroute.nameRouote_DonationScreen: (ctx) => DonationScreen(),
        nameroute.nameRouote_Details: (ctx) => Details(),
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
  // ignore: constant_identifier_names
  static const nameRouote_ExChangForAll = '/ExChangForAll';
  // ignore: constant_identifier_names
  static const nameRouote_SupCattogryScreen = '/SupCattogryScreen';
  // ignore: constant_identifier_names
  static const nameRouote_DonationScreen = '/DonationScreen';
  // ignore: constant_identifier_names
  static const nameRouote_Details = '/Details';
}

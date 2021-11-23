import 'package:exchange/colors.dart';
import 'package:exchange/widgets/exchang_for_nv_bar/conferm_exchange.dart';
import 'package:exchange/widgets/exchang_for_nv_bar/exchange_for_all.dart';
import 'package:exchange/widgets/exchang_for_nv_bar/my_exchange.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class ExChangForAll extends StatefulWidget {
  const ExChangForAll({Key? key}) : super(key: key);

  @override
  _ExChangForAllState createState() => _ExChangForAllState();
}

late int currentPage;

List WidgetForShow = [
  ExchangeScreen(),
  MyExchange(),
  ConfermExchang(),
];

class _ExChangForAllState extends State<ExChangForAll> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentPage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WidgetForShow[currentPage],
        bottomNavigationBar: FancyBottomNavigation(
          circleColor: ColorForDesign.yellowwhite,
          activeIconColor: ColorForDesign().green,
          textColor: ColorForDesign.yellowwhite,
          inactiveIconColor: ColorForDesign().yellow,
          barBackgroundColor: ColorForDesign().green,
          tabs: [
            TabData(iconData: Icons.restart_alt_rounded, title: " Exchang "),
            TabData(
                iconData: Icons.change_circle_outlined, title: "My Exchang "),
            TabData(
                iconData: Icons.published_with_changes_rounded,
                title: "Conferm"),
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}

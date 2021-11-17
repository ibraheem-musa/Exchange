import 'package:exchange/colors.dart';
import 'package:exchange/screen/exchange.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class ExChangForAll extends StatefulWidget {
  const ExChangForAll({Key? key}) : super(key: key);

  @override
  _ExChangForAllState createState() => _ExChangForAllState();
}

List WidgetForShow = [
  ExchangeScreen(),
  ExchangeScreen(),
  ExchangeScreen(),
  ExchangeScreen(),
];
int currentPage = 0;

class _ExChangForAllState extends State<ExChangForAll> {
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
                title: "Done Exchang "),
            TabData(iconData: Icons.trending_down, title: "Metaphor")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}

import 'package:exchange/colors.dart';
import 'package:exchange/widgets/donation_for_nv_bar/conferm_donation.dart';
import 'package:exchange/widgets/donation_for_nv_bar/donation_for_all.dart';
import 'package:exchange/widgets/donation_for_nv_bar/my_donation.dart';
import 'package:exchange/widgets/exchang_for_nv_bar/exchange_for_all.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

late int currentPage;

List WidgetForShow = [
  DonationForMainScreen(),
  MyDonation(),
  ConfermDonation(),
];

class _DonationScreenState extends State<DonationScreen> {
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
            TabData(iconData: Icons.restart_alt_rounded, title: " Donation "),
            TabData(
                iconData: Icons.change_circle_outlined, title: "My Donation "),
            TabData(
                iconData: Icons.published_with_changes_rounded, title: "Done"),
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}

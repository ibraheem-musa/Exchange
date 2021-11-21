// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:exchange/colors.dart';
import 'package:exchange/main.dart';
import 'package:exchange/widgets/drawer_for_app.dart';
import 'package:exchange/widgets/list_for_post.dart';
import 'package:flutter/material.dart';

class ModelOflist {
  late String imagesForitem;
  late String namOfItem;
  late String des;
  ModelOflist(
      {required this.des,
      required this.imagesForitem,
      required this.namOfItem});
}

List<ModelOflist> modelOflist = [
  ModelOflist(
      des: "thes is new for all thing",
      imagesForitem:
          "https://www.rei.com/dam/winter_camping_checklist_hero_lg.jpg",
      namOfItem: "Home items"),
  ModelOflist(
      des:
          "thes is new for all thing thes is new for all thing thes is new for all thing thes is new for all thing thes is new for all thing",
      imagesForitem:
          "https://www.rei.com/dam/ea-graphic-camp-kitchen-checklist-hero-lg.jpg",
      namOfItem: "Home items"),
  ModelOflist(
      des: "thes is new for all thing",
      imagesForitem:
          "https://www.verywellfamily.com/thmb/7OYStn77oC9nsHG857Ad3VAT084=/1885x1414/smart/filters:no_upscale()/GettyImages-802352810-bd9022e99a1d40e6995284a1d0d22ddb.jpg",
      namOfItem: "back to school"),
  ModelOflist(
      des: "thes is new for all thing",
      imagesForitem:
          "https://www.rei.com/dam/winter_camping_checklist_hero_lg.jpg",
      namOfItem: "Home items"),
  ModelOflist(
      des: "thes is new for all thing",
      imagesForitem:
          "https://www.rei.com/dam/ea-graphic-camp-kitchen-checklist-hero-lg.jpg",
      namOfItem: "Home items"),
  ModelOflist(
      des: "thes is new for all thing",
      imagesForitem:
          "https://www.verywellfamily.com/thmb/7OYStn77oC9nsHG857Ad3VAT084=/1885x1414/smart/filters:no_upscale()/GettyImages-802352810-bd9022e99a1d40e6995284a1d0d22ddb.jpg",
      namOfItem: "back to school"),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorForDesign().white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "home bage",
          style: TextStyle(color: ColorForDesign.yellowwhite),
        ),
        backgroundColor: ColorForDesign().green,
      ),
      body: ListView.builder(
          itemCount: modelOflist.length,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, nameroute.nameRouote_SupCattogryScreen);
              },
              child: CatgoryListView(
                describtion: modelOflist[i].des,
                name: modelOflist[i].namOfItem,
                ImageForpost: modelOflist[i].imagesForitem,
              ),
            );
          }),
      drawer: DrawerForAPP(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, nameroute.nameRouote_DonationScreen);
                  },
                  child: cardForexchange(
                    text: "Donation",
                    RadiusforCard: true,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, nameroute.nameRouote_ExChangForAll);
                  },
                  child: cardForexchange(
                    text: "Exchang",
                    RadiusforCard: false,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class cardForexchange extends StatelessWidget {
  String text;
  bool RadiusforCard;
  cardForexchange({required this.text, required this.RadiusforCard});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: RadiusforCard
                ? BorderRadius.only(bottomLeft: Radius.circular(50))
                : BorderRadius.only(bottomRight: Radius.circular(50))),
        color: ColorForDesign.yellowwhite,
        elevation: 12,
        shadowColor: ColorForDesign().darkgreen,
        child: Center(
            child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 2.4,
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                )))));
  }
}

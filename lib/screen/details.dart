import 'package:exchange/colors.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var detalis = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        backgroundColor: ColorForDesign.yellowwhite,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                      backgroundColor: ColorForDesign().green,
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorForDesign.yellowwhite,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  IconButton(
                      disabledColor: ColorForDesign().darkgreen,
                      focusColor: ColorForDesign().darkgreen,
                      hoverColor: ColorForDesign().darkgreen,
                      splashColor: ColorForDesign().darkgreen,
                      highlightColor: ColorForDesign().darkgreen,
                      color: ColorForDesign().darkgreen,
                      icon: Icon(
                        Icons.report,
                        color: ColorForDesign().darkgreen,
                      ),
                      onPressed: () {
                        print("object");
                      }),
                ],
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        detalis[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            Text(
                              detalis[2],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "state:  Good for use in tow month ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: const Text(
                  "description ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Text(
              detalis[0],
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}

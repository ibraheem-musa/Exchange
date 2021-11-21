import 'package:exchange/colors.dart';
import 'package:flutter/material.dart';

class MyDonation extends StatefulWidget {
  const MyDonation({Key? key}) : super(key: key);

  @override
  _MyDonationState createState() => _MyDonationState();
}

class _MyDonationState extends State<MyDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: ColorForDesign.yellowwhite,
            width: double.infinity,
            height: double.infinity,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (_, index) {
                return cards(
                  imageses:
                      "https://thumbs.dreamstime.com/b/donation-concept-box-stuff-text-donate-things-lettering-isolated-white-background-charity-elements-vector-color-153518356.jpg",
                  text: "my Exchang",
                );
              },
              itemCount: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 50),
            child: FloatingActionButton(
                backgroundColor: ColorForDesign().green,
                child: const Icon(
                  Icons.arrow_back,
                  color: ColorForDesign.yellowwhite,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}

class cards extends StatelessWidget {
  String text;

  String imageses;
  cards({required this.imageses, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              // offset: const Offset(3, 3),
              blurRadius: 16,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageses,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: ColorForDesign.yellowwhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  text,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: ColorForDesign().litegreen,
                                  backgroundColor: ColorForDesign().litegreen,
                                ),
                                onPressed: () {},
                                child: const Text("Donated by",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorForDesign.yellowwhite)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

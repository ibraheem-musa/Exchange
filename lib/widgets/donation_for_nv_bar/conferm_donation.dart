import 'package:exchange/colors.dart';
import 'package:flutter/material.dart';

class ConfermDonation extends StatefulWidget {
  const ConfermDonation({Key? key}) : super(key: key);

  @override
  _ConfermDonationState createState() => _ConfermDonationState();
}

class _ConfermDonationState extends State<ConfermDonation> {
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
                      "https://www.dndbeyond.com/avatars/thumbnails/7/384/1000/1000/636284764677563266.jpeg",
                  text: "my Donation",
                );
              },
              itemCount: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 50),
            child: FloatingActionButton(
                backgroundColor: ColorForDesign().litegreen,
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
  cards({
    required this.imageses,
    required this.text,
  });

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
              offset: const Offset(3, 3),
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: ColorForDesign.yellowwhite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
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
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.done,
                                size: 35,
                                color: ColorForDesign().litegreen,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            IconButton(
                              splashColor: ColorForDesign().litegreen,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.cancel,
                                size: 35,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

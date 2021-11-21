import 'package:exchange/colors.dart';
import 'package:flutter/material.dart';

class DonationForMainScreen extends StatefulWidget {
  const DonationForMainScreen({Key? key}) : super(key: key);

  @override
  _DonationForMainScreenState createState() => _DonationForMainScreenState();
}

class _DonationForMainScreenState extends State<DonationForMainScreen> {
  @override
  Widget build(BuildContext context) {
    String Search;

    return SafeArea(
      child: Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        body: Container(
          color: ColorForDesign.yellowwhite,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                color: ColorForDesign.yellowwhite,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FloatingActionButton(
                                  backgroundColor: ColorForDesign().litegreen,
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: ColorForDesign.yellowwhite,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 10, right: 10, bottom: 10),
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: ColorForDesign().litegreen,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20)),
                              child: const Center(
                                  child: Text(
                                "Donation",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorForDesign.yellowwhite),
                              ))),
                        ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: ColorForDesign.black, fontSize: 15),
                        cursorColor: ColorForDesign().green,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: ColorForDesign().green,
                          ),
                          labelText: 'Search',
                          labelStyle: TextStyle(color: ColorForDesign().green),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: ColorForDesign().green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: ColorForDesign().green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          Search = newvalue!;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: itemList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                      ),
                      itemBuilder: (_, i) {
                        return cards(
                            describtion: itemList[i].description,
                            imageses: itemList[i].imageForcard,
                            text: itemList[i].name);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class Modelitem {
  late String name;
  late String imageForcard;
  late String description;
  Modelitem(
      {required this.description,
      required this.imageForcard,
      required this.name});
}

List<Modelitem> itemList = [
  Modelitem(
      name: "T-shirt",
      imageForcard:
          'https://i5.walmartimages.com/asr/93a95865-296f-4bf4-b15d-c8709a4ccdff.64a6cc18098dee727fc4ffbf229bb5fb.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
      description: "good material and very nice looking"),
  Modelitem(
      name: "back bag",
      imageForcard:
          "https://img3.exportersindia.com/product_images/bc-full/dir_110/3270209/leather-backpack-bags-green-colour-1465548.jpg",
      description:
          "to put you book items and other things like pencil or pen ,and clothesto put you book items and other things like pencil or pen ,and clothes"),
  Modelitem(
    imageForcard:
        "https://myboredtoddler.com/wp-content/uploads/2018/02/color-recognition-scavenger-hunt-for-toddlers-e1519348310933.jpg",
    name: "Scavenger Hunt",
    description: "good for food, vegetable and fruit ",
  ),
  Modelitem(
      name: "mug",
      imageForcard:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQX7FRHnU1AvmU1a-_BdEX_NGunyp_dj0gxLmkinLMxCg4HBZO7WewOnM_GmikMwhUnLA&usqp=CAU",
      description: ""),
  Modelitem(
      name: "T-shirt",
      imageForcard:
          'https://i5.walmartimages.com/asr/93a95865-296f-4bf4-b15d-c8709a4ccdff.64a6cc18098dee727fc4ffbf229bb5fb.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
      description: "good material and very nice looking"),
  Modelitem(
      name: "back bag",
      imageForcard:
          "https://img3.exportersindia.com/product_images/bc-full/dir_110/3270209/leather-backpack-bags-green-colour-1465548.jpg",
      description:
          "to put you book items and other things like pencil or pen ,and clothesto put you book items and other things like pencil or pen ,and clothes"),
  Modelitem(
    imageForcard:
        "https://myboredtoddler.com/wp-content/uploads/2018/02/color-recognition-scavenger-hunt-for-toddlers-e1519348310933.jpg",
    name: "Scavenger Hunt",
    description: "good for food, vegetable and fruit ",
  ),
  Modelitem(
      name:
          "mug lk maxLines: 2 maxLines: 2 maxLines: 2 maxLines: 2 maxLines: 2",
      imageForcard:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQX7FRHnU1AvmU1a-_BdEX_NGunyp_dj0gxLmkinLMxCg4HBZO7WewOnM_GmikMwhUnLA&usqp=CAU",
      description: "for watirv ds"),
];

class cards extends StatelessWidget {
  String text;
  String describtion;
  String imageses;
  cards(
      {required this.imageses, required this.text, required this.describtion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(4, 4),
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 8, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                text,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Wrap(
                                  children: <Widget>[
                                    Text(
                                      "describtion" + describtion,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

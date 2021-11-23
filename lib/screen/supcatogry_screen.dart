import 'package:exchange/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SupCattogryScreen extends StatefulWidget {
  const SupCattogryScreen({Key? key}) : super(key: key);

  @override
  _SupCattogryScreenState createState() => _SupCattogryScreenState();
}

class _SupCattogryScreenState extends State<SupCattogryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorForDesign.yellowwhite,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "home bage",
            style: TextStyle(color: ColorForDesign.yellowwhite),
          ),
          backgroundColor: ColorForDesign().green,
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5 / 3,
            ),
            itemCount: 8,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
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
                    child: Container(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://img2.sportconcept.com/backend_nou/content/medii/-stufvanessa-275-20210507130308.jpg",
                              placeholder: (context, url) => Container(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            color: ColorForDesign().darkyellow,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  "its just colomn and cds",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })

        // (
        //     itemCount: 8,
        //     itemBuilder: (_, index) {
        //       return SupCatogry(
        //           imageSup:
        //               "https://i.ytimg.com/vi/tJUFXOma_o4/maxresdefault.jpg",
        //           nameSup: "Sup catogry");
        //     }),
        );
  }
}

class SupCatogry extends StatelessWidget {
  String imageSup;
  String nameSup;
  SupCatogry({required this.imageSup, required this.nameSup});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorForDesign().darkyellow,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              offset: const Offset(4, 4),
              blurRadius: 16,
            ),
          ],
        ),
        height: 130,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                child: Image.network(
                  imageSup,
                  // height: 100,
                  // width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  nameSup,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

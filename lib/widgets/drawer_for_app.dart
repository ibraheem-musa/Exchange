import 'package:exchange/colors.dart';
import 'package:flutter/material.dart';

class DrawerForAPP extends StatefulWidget {
  const DrawerForAPP({Key? key}) : super(key: key);

  @override
  _DrawerForAPPState createState() => _DrawerForAPPState();
}

class _DrawerForAPPState extends State<DrawerForAPP> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //  backgroundColo: Color(0xffbf942e),
      child: ListView(
        shrinkWrap: true,
        children: [
          // !loginORlogout
          //     ? Row(
          //         // crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           OutlinedButton(
          //             style: OutlinedButton.styleFrom(
          //                 primary: ColorForDesign().yellow,
          //                 side: BorderSide(width: 2.0, color: Colors.black),
          //                 // backgroundColor: ColorForDesign().Gold,
          //                 fixedSize: Size(200, 35)),
          //             onPressed: () {

          //             },
          //             child: Text('Log in',
          //                 style: TextStyle(
          //                     fontSize: 20, color: ColorForDesign().green)),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 8.0),
          //             child: IconButton(
          //                 onPressed: () {
          //                   // Navigator.pop(context);
          //                   // Navigator.push(
          //                   //     context,
          //                   //     MaterialPageRoute(
          //                   //         builder: (context) => SettingScreen()));
          //                 },
          //                 icon: Icon(Icons.settings)),
          //           )
          //         ],
          //       )
          //     :
          Container(
            color: ColorForDesign().darkgreen,
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              children: [
                Expanded(
                  // height: MediaQuery.of(context).size.height / 6,

                  child: Stack(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000.0),
                            child: Image.asset('assets/LOGOexchange.jpg'),
                          ),
                        ),
                      ),
                      //   ],
                      // ),
                      Positioned(
                        right: 5,
                        child: IconButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             SettingScreen()
                              //             ));
                            },
                            icon: Icon(Icons.settings)),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Ibraheem",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'finaluserEmail',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          ListtileRForListdrwer(
            iconForListTile: Icons.image,
            // opject: Galary(),
            text: "gallery",
          ),
          ListtileRForListdrwer(
            iconForListTile: Icons.checklist_rounded,
            // opject: OrdersHistory(),
            text: "ordersHistory",
          ),
          ListtileRForListdrwer(
            iconForListTile: Icons.message_rounded,
            // opject: ContactUs(),
            text: "ContactUs",
          ),
          // ListtileRForListdrwer(
          //   opject: Franchise(),
          //   text: "franchise",
          // ),
          ListtileRForListdrwer(
            iconForListTile: Icons.privacy_tip,
            // opject: PrivacyAndPolicy(),
            text: "PrivacyandPolicy",
          ),
          ListtileRForListdrwer(
            iconForListTile: Icons.assignment_outlined,
            // opject: TermsAndConditions(),
            text: "TermsandCondition",
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: ColorForDesign().green,
                ),
                title: const Text(
                  "languageChange",
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  // case4();
                },
              ),
              const Divider(
                height: 0,
                color: Colors.black,
                thickness: 1,
                indent: 5,
                endIndent: 25,
              )
            ],
          ),
          ListtileRForListdrwer(
            iconForListTile: Icons.logout,
            // opject: TermsAndConditions(),
            text: "Log Out",
          ),
        ],
      ),
    );
  }
}

class ListtileRForListdrwer extends StatelessWidget {
  String text;
  var opject;
  IconData iconForListTile;
  ListtileRForListdrwer(
      {required this.iconForListTile, this.opject, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            iconForListTile,
            color: ColorForDesign().darkgreen,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => opject));
          },
        ),
        const Divider(
          height: 0,
          color: Colors.black,
          thickness: 1,
          indent: 5,
          endIndent: 25,
        )
      ],
    );
  }
}

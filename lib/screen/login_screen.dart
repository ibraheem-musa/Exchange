// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:exchange/colors.dart';
import 'package:exchange/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginformkey = GlobalKey<FormState>();
  var signUpformkey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  bool _passwordsignupVisible = true;
  bool _passwordsignupconfermVisible = true;

  late String userEmail;
  late String userPassowrd;

  late String signUPUserEmail;
  late String signUPName;
  late String signUPphoneNumber;
  late String signUPpassword;
  late String signUPConfirmPassword;

  bool loginorsignup = true;
  bool checkboxvalue = false;

  CheckifTheTextBoxEmpty() {
    if (loginorsignup == true) {
      if (!loginformkey.currentState!.validate()) {
        return null;
      } else {
        loginformkey.currentState!.save();
        // loginIn(userEmail, userPassowrd);
      }
    }
    //-sign Up for Form------------------------
    else if (!signUpformkey.currentState!.validate()) {
      return null;
    } else {
      signUpformkey.currentState!.save();
      if (signUPpassword == signUPConfirmPassword) {
        // SignUpToDataBase(
        //     signUPUserEmail, signUPName, signUPpassword, signUPphoneNumber);
      } else {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: ColorForDesign().green,
                content: Text("confirm your password !!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorForDesign.yellowwhite,
                    )),
                actions: <Widget>[
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: Text('OK',
                          style: TextStyle(
                            color: ColorForDesign.yellowwhite,
                          )),
                    ),
                  ),
                ],
              );
            });
      }
    }
  }

  // Future SignUpToDataBase(var email, var name, var pass, var phone) async {
  //   String url = '';
  //   final response = await http.post(Uri.parse(url), body: {
  //     "name": name,
  //     "email": email.toString(),
  //     "password": pass,
  //     "phone": phone
  //   });
  //   print(response.body);
  //   var json = jsonDecode(response.body);
  //   if (json['error']) {
  //     showDialog<String>(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //             backgroundColor: ColorForDesign().green,
  //             content: Text('this account is already exist',
  //                 style: TextStyle(
  //                   color: ColorForDesign().yellowwhite,
  //                 )),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context, 'OK'),
  //                 child: Text('OK',
  //                     style: TextStyle(
  //                       color: ColorForDesign().yellowwhite,
  //                     )),
  //               ),
  //             ],
  //           );
  //         });
  //   } else {
  //     setState(() {
  //       loginorsignup = !loginorsignup;
  //     });
  //   }
  // }

// //-----------------------------------------------------------------
//   Future<bool> loginIn(var email, var pass) async {
//     String url = 'http://45.76.143.83/api/authentication/login.php';
//     final response = await http.post(Uri.parse(url), body: {
//       "email": email.toString(),
//       "password": pass,
//     });
//     print(response.body);
//     var json = jsonDecode(response.body);
//     if (json['error']) {
//       showDialog<String>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               backgroundColor: ColorForDesign().green,
//               content: Text(
//                   "We can't find this account. Please try another active account",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: ColorForDesign().yellowwhite,
//                   )),
//               actions: <Widget>[
//                 Center(
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context, 'OK'),
//                     child: Text('OK',
//                         style: TextStyle(
//                           color: ColorForDesign().yellowwhite,
//                         )),
//                   ),
//                 ),
//               ],
//             );
//           });
//     } else {
//       // SharedPreferences sharedPreferences =
//       //     await SharedPreferences.getInstance();
//       // sharedPreferences.setString('userEmail', userEmail);
//       // Navigator.of(context).pushReplacement(
//       //     MaterialPageRoute(builder: (context) => HomeScreen()));
//       // Navigator.push
//       // Navigator.pushReplacementNamed(context, nameroute.nameRouote_HomeScreen);
// // User(error:json['error'],user:json['email'],message: json['message']  );

//     }
//   }
// //-----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorForDesign.yellowwhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(505.0),
                  ),
                  elevation: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.0),
                    child: Image.asset(
                      "assets/LOGOexchange.jpg",
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: Text(
                  "Exchange",
                  style: TextStyle(fontSize: 25, color: ColorForDesign().green),
                ),
              ),
              loginorsignup
                  ? Form(
                      key: loginformkey,
                      child: Wrap(
                        runSpacing: 10,
                        children: [
                          //-----------Theme for TextFormFields---------------------
                          Theme(
                            data: ThemeData(
                              primaryColor: ColorForDesign().green,
                              focusColor: ColorForDesign().green,
                              hintColor: ColorForDesign().green,
                            ),
                            child: Wrap(
                              runSpacing: 10,
                              children: [
                                //-----------enter your username---------------------
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        style: TextStyle(
                                            color: ColorForDesign().green),
                                        cursorColor: ColorForDesign().green,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: ColorForDesign().green,
                                          ),
                                          labelText: "enter your Email",
                                          labelStyle: TextStyle(
                                              color: ColorForDesign().green),
                                          fillColor: Colors.amber,
                                          // hoverColor: Colors.amber,
                                          // hintText: "Enter Email",
                                          hintStyle: TextStyle(
                                              color: ColorForDesign().green),

                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: ColorForDesign().green,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
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
                                          userEmail = newvalue!;
                                        },
                                      ),
                                    ),

                                    //-----------enter your passowrd---------------------

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        obscureText: _passwordVisible,
                                        style: TextStyle(
                                            color: ColorForDesign().green),
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                            icon: Icon(
                                              _passwordVisible
                                                  ? Icons.visibility_sharp
                                                  : Icons.visibility_off,
                                              color: ColorForDesign().green,
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: ColorForDesign().green,
                                          ),

                                          labelText: "enter your passowrd",
                                          labelStyle: TextStyle(
                                              color: ColorForDesign().green),
                                          fillColor: Colors.amber,
                                          // hoverColor: Colors.amber,
                                          // hintText: "Enter Email",
                                          // hintStyle: TextStyle(color:  ColorForDesign().green),

                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: ColorForDesign().green,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
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
                                          userPassowrd = newvalue!;
                                        },
                                      ),
                                    ),

                                    // Row(
                                    //   children: [
                                    // Theme(
                                    // data: ThemeData(
                                    //   unselectedWidgetColor:
                                    //       ColorForDesign().green,
                                    // ),
                                    //       child: Checkbox(
                                    // checkColor: ColorForDesign().yellowwhite,
                                    // focusColor: ColorForDesign().green,
                                    // hoverColor: ColorForDesign().green,
                                    // activeColor: ColorForDesign().green,
                                    //         value: checkboxvalue,
                                    //         onChanged: (bo) {
                                    //           setState(() {
                                    //             checkboxvalue = !checkboxvalue;
                                    //           });
                                    //         },
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       "stay login",
                                    //       style: TextStyle(
                                    //           color: ColorForDesign().green,
                                    //           fontSize: 16),
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                )

                                //---------------sign up ---------------------

                                //---------------sign up ---------------------
                              ],
                            ),
                          ),
                          //-----------end Theme for TextFormFields---------------------
                        ],
                      ),
                    )
                  : Form(
                      key: signUpformkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15),
                              cursorColor: ColorForDesign().green,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_box,
                                  color: ColorForDesign().green,
                                ),
                                labelText: 'Name',
                                labelStyle:
                                    TextStyle(color: ColorForDesign().green),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
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
                                signUPName = newvalue!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15),
                              cursorColor: ColorForDesign().green,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: ColorForDesign().green,
                                ),
                                labelText: "Email",
                                labelStyle:
                                    TextStyle(color: ColorForDesign().green),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
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
                                signUPUserEmail = newvalue!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15),
                              cursorColor: ColorForDesign().green,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: ColorForDesign().green,
                                ),
                                labelText: 'Phone Number',
                                labelStyle:
                                    TextStyle(color: ColorForDesign().green),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
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
                                signUPphoneNumber = newvalue!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: _passwordsignupVisible,
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15),
                              cursorColor: ColorForDesign().green,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordsignupVisible =
                                          !_passwordsignupVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordsignupVisible
                                        ? Icons.visibility_sharp
                                        : Icons.visibility_off,
                                    color: ColorForDesign().green,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: ColorForDesign().green,
                                ),
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(color: ColorForDesign().green),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
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
                                signUPpassword = newvalue!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: _passwordsignupconfermVisible,
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 15),
                              cursorColor: ColorForDesign().green,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordsignupconfermVisible =
                                          !_passwordsignupconfermVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordsignupconfermVisible
                                        ? Icons.visibility_sharp
                                        : Icons.visibility_off,
                                    color: ColorForDesign().green,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_clock_sharp,
                                  color: ColorForDesign().green,
                                ),
                                labelText: 'Confirm Password',
                                labelStyle:
                                    TextStyle(color: ColorForDesign().green),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
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
                                signUPConfirmPassword = newvalue!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //-----------RaisedButton login---------------------
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: ColorForDesign().green,
                          backgroundColor: ColorForDesign().green,
                          fixedSize: Size(200, 35)),
                      onPressed: () {
                        // CheckifTheTextBoxEmpty();
                        Navigator.pushReplacementNamed(
                            context, nameroute.nameRouote_HomeScreen);
                      },
                      child: Text(loginorsignup ? 'Log in' : 'sign up',
                          style: TextStyle(
                              fontSize: 20, color: ColorForDesign.yellowwhite)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                primary: ColorForDesign().green,
                                fixedSize: Size(120, 20)),
                            //----------------------
                            onPressed: () {
                              setState(() {
                                loginorsignup = !loginorsignup;
                              });
                            },
                            //----------------------
                            child: Text(loginorsignup ? 'sign up' : 'Log in',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorForDesign().green))),
                      ],
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

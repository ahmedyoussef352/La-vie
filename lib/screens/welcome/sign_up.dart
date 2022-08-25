import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/screens/splach_screen/splash_screen.dart';
import 'package:odc/screens/welcome/login.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:odc/screens/home/home_page.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:odc/shared/componant/componant.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final dynamic user = (await auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {
      print(e);
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////apple

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    var sha256;
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  TextEditingController FirstName = new TextEditingController();
  TextEditingController LastName = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController retryPassword = new TextEditingController();
  var formstate = new GlobalKey<FormState>();
  bool send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  final controller = PageController();
  Widget _formFieldWidget(
      {required String errorMassageSmall,
      required String errorMassagelong,
      required controller,
      bool isObscure = false}) {
    return Container(
      height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)),
        
        child: isObscure == true
            ? TextFormField(
                keyboardType: TextInputType.number,
                obscureText: isObscure,
                controller: controller,
                onChanged: (text) {
                  print(text);
                },
                validator: (text) {
                  if (text!.length == 0) {
                    return 'It is Empty';
                  } else if (text.length < 4) {
                    return errorMassageSmall;
                  } else if (text.length > 14) {
                    return errorMassagelong;
                  } else {
                    return null;
                  }
                },
                cursorColor: Colors.black,
                cursorWidth: 2,
                cursorHeight: 7,
                enabled: true,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: HexColor('#1ABC00'),
                      width: 2,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.2),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 18, color: Colors.grey.shade400)),
              )
            : TextFormField(
                obscureText: isObscure,
                controller: controller,
                onChanged: (text) {
                  print(text);
                },
                validator: (text) {
                  if (text!.length == 0) {
                    return 'It is Empty';
                  } else if (text.length < 8) {
                    return errorMassageSmall;
                  } else if (text.length > 16) {
                    return errorMassagelong;
                  } else {
                    return null;
                  }
                },
                cursorColor: Colors.black,
                cursorWidth: 2,
                cursorHeight: 7,
                enabled: true,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: HexColor('#1ABC00'),
                      width: 2,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.2),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 18, color: Colors.grey.shade400)),
              ));
  }

  Widget _textWidget(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8),
      child: Text(text,
          textAlign: TextAlign.start,
          style: TextStyle(
            
            fontSize: 16,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 600,
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Form(
            key: formstate,
            child: ListView(children: [
              

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textWidget('First Name'),
                    _formFieldWidget(
                    errorMassageSmall: 'Your First Name is very small ',
                    errorMassagelong: 'Your First Name is very long',
                    controller: FirstName,
                    isObscure: false),
                  
                      ],
                    ),
                  ),
                  
                  
                  SizedBox(
                  width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textWidget('Last Name'),
                    _formFieldWidget(
                    errorMassageSmall: 'Your Last name is very small ',
                    errorMassagelong: 'Your Last name is very long',
                    controller: LastName,
                    isObscure: false),
                      ],
                    ),
                  ),
                    ],
                  ),
                   _textWidget('E-mail'),
                    _formFieldWidget(
                    errorMassageSmall: 'Your E-mail is very small ',
                    errorMassagelong: 'Your E-mail is very long',
                    controller: LastName,
                    isObscure: false),
                      

                  
                  
                  SizedBox(
                    height: 10,
                  ),
                  _textWidget('Password'),
                  _formFieldWidget(
                    isObscure: true,
                    errorMassageSmall: 'password is very small',
                    errorMassagelong: 'password is very  long',
                    controller: password,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _textWidget('Confirm password'),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    width: double.infinity,
                    child:
                        //////
                        TextFormField(
                      obscureText: true,
                      controller: retryPassword,
                      onChanged: (text) {
                        print(text);
                      },
                      validator: (text) {
                        if (text!.length == 0) {
                          return 'It is Empty';
                        } else if (text != password.text) {
                          return 'This password isn\'t identical';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      cursorWidth: 2,
                      cursorHeight: 7,
                      enabled: true,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: HexColor('#1ABC00'),
                            width: 2,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.2),
                          ),
                        
                          hintStyle: TextStyle(
                              fontSize: 18, color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                    color: HexColor('#1ABC00'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                    child: InkWell(
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                       if (send()) {
                              navigatTo(context, Login());
                            } 
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Container(
                            width: 95,
                            child: Divider(
                              color: Colors.grey,
                              height: 2,
                              thickness: 1,
                            )),
                        SizedBox(width: 10),
                        Text(
                          'or continue with',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 10),
                        Container(
                            width: 95,
                            child: Divider(
                              color: Colors.grey,
                              height: 2,
                              thickness: 1,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 115),
                    child: Center(
                      child: Expanded(
                        child: Row(
                          children: [
                            InkWell(
                              child: Image.asset('assets/Google (1).png'),
                              onTap: () async {
                                await _googleSignUp().then(
                                  (value) =>
                                      Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              child: Image.asset('assets/Facebook.png'),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          )),
    );
  }
}

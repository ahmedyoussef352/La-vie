import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/screens/splach_screen/splash_screen.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:odc/screens/home/home_page.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  Widget _formFieldWidget(
      {
      required String errorMassageSmall,
      required String errorMassagelong,
      required TextInputType text,
      required controller,
      bool isObscure = false}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        keyboardType: text,
        onChanged: (text) {
          print(text);
        },
        validator: (text) {
          if (text!.length == 0) {
            return 'It is Empty';
          } else if (text.length < 8) {
            return errorMassageSmall;
          } else if (text.length > 16) {
            return errorMassageSmall;
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
        ),
      ),
    );
  }

  Widget _textWidget(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Text(text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
          )),
    );
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController retryPassword = new TextEditingController();
  var formstate = new GlobalKey<FormState>();
  var formstate2 = new GlobalKey<FormState>();
  bool send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool forget() {
    var formdata = formstate2.currentState;
    if (formdata!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 480,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Form(
          key: formstate,
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                _textWidget('Email'),
                _formFieldWidget(
                    text: TextInputType.emailAddress,
                    errorMassageSmall: 'Email is very small ',
                    errorMassagelong: 'Email is very long',
                    
                    controller: email,
                    isObscure: false),
                SizedBox(
                  height: 20,
                ),
                _textWidget('Password'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _formFieldWidget(
                      isObscure: true,
                      text: TextInputType.number,
                      errorMassageSmall: 'Email is very small',
                      errorMassagelong: 'Email is very long',
                      
                      controller: password,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      child: Text(
                        'Froget my password',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => buildsheet());
                      },
                    )
                  ],
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
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                       if (send()) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Home();
                              }));
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
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 115),
                  child: Center(
                    child: Row(
                      children: [
                        InkWell(
                          child: Image.asset('assets/Google (1).png'),
                          onTap: () async {
                            await _googleSignUp().then(
                              (value) => Navigator.of(context).pushReplacement(
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
                            onTap: () {})
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }

  Widget buildsheet() => Form(
        key: formstate2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 350,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                _textWidget('Password'),
                _formFieldWidget(
                  isObscure: true,
                  errorMassageSmall: 'password is very small',
                  errorMassagelong: 'password is very  long',
                  controller: password,
                  text: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                _textWidget('replay password'),
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
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                       if (forget()) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            } 
                      },
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      );
}

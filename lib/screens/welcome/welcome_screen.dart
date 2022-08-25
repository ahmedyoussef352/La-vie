import 'package:flutter/material.dart';
import 'package:odc/screens/welcome/login.dart';
import 'package:odc/screens/welcome/sign_up.dart';
import 'package:hexcolor/hexcolor.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  
   Widget _formFieldWidget(
      {required String hinttext,
      required String errorMassageSmall,
      required String errorMassagelong,
      required controller,
      required IconData icon,
      bool isObscure = false}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        onChanged: (text) {
          print(text);
        },
        validator: (text) {
          if (text!.length == 0) {
            return 'It is Empty';
          } else if (text.length < 8) {
            return errorMassagelong;
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
              color: Color.fromARGB(255, 13, 154, 18),
              width: 2,
            )),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.2),
            ),
            prefixIcon: Icon(
              icon,
              color: Color.fromARGB(255, 13, 154, 18),
              size: 30,
            ),
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade400)),
      ),
    );
  }
  
  TextEditingController email = new TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
          Container(
            margin: EdgeInsets.only(left: 250),
            child: Image.asset('assets/login1.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            child: Image.asset('assets/signuplogo.png'),
          ),
          SizedBox(height: 30,),
          Container(
              height: 40,
              child:  TabBar(
                indicatorColor: HexColor('#1ABC00'),            
                labelColor: HexColor('#1ABC00'),
                unselectedLabelColor: Colors.grey,
                tabs: const  [
                  Tab(text: 'Sigin Up',),
                  Tab(text: 'Login',),
                ],
              ),
            ),
            const Expanded(
                child: TabBarView(
                  children:  [
                    Center(child: Signup(),),
                    Center(child: Login(),),
                  ],
                )
            ),
          //login
         
              //signup
              
              Container(
            margin: EdgeInsets.only( right: 250),
            child: Image.asset('assets/signup2.png'),
          ),
              
        ],
        ),
    ));
  }

  
}

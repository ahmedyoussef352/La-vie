// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hexcolor/hexcolor.dart';

// class TextFormFeild extends StatefulWidget {
//    String errorMassageSmall;
//     String errorMassagelong;
//     String controller;
//     bool isObscure ;
//   TextFormFeild({
//     required this.errorMassageSmall,
//       required this.errorMassagelong,
//       required this.controller,
//      required this.isObscure ,
//   });

//   @override
//   State<TextFormFeild> createState() => _TextFormFeildState();
// }

// class _TextFormFeildState extends State<TextFormFeild> {
//   @override
//   Widget build(BuildContext context) {
//     return _formFieldWidget(errorMassageSmall: 'errorMassageSmall',
//      errorMassagelong: 'errorMassagelong',
//     controller: 'controller');
    
//   }
//     Widget _formFieldWidget(
//       {required String errorMassageSmall,
//       required String errorMassagelong,
//       required controller,
//       bool isObscure = false}) {
//     return Container(
//         decoration: BoxDecoration(
          
//           borderRadius: BorderRadius.circular(30)),
        
//         child: isObscure == true
//             ? TextFormField(
//                 keyboardType: TextInputType.number,
//                 obscureText: widget.isObscure,
//                 controller: widget.controller,
//                 onChanged: (text) {
//                   print(text);
//                 },
//                 validator: (text) {
//                   if (text!.length == 0) {
//                     return 'It is Empty';
//                   } else if (text.length < 4) {
//                     return widget.errorMassageSmall;
//                   } else if (text.length > 14) {
//                     return widget.errorMassagelong;
//                   } else {
//                     return null;
//                   }
//                 },
//                 cursorColor: Colors.black,
//                 cursorWidth: 2,
//                 cursorHeight: 7,
//                 enabled: true,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontStyle: FontStyle.normal,
//                 ),
//                 decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                       color: HexColor('#1ABC00'),
//                       width: 2,
//                     )),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 0.2),
//                     ),
//                     hintStyle:
//                         TextStyle(fontSize: 18, color: Colors.grey.shade400)),
//               )
//             : TextFormField(
//                 obscureText: widget.isObscure,
//                 controller: widget.controller,
//                 onChanged: (text) {
//                   print(text);
//                 },
//                 validator: (text) {
//                   if (text!.length == 0) {
//                     return 'It is Empty';
//                   } else if (text.length < 8) {
//                     return widget.errorMassageSmall;
//                   } else if (text.length > 16) {
//                     return widget.errorMassagelong;
//                   } else {
//                     return null;
//                   }
//                 },
//                 cursorColor: Colors.black,
//                 cursorWidth: 2,
//                 cursorHeight: 7,
//                 enabled: true,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontStyle: FontStyle.normal,
//                 ),
//                 decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                       color: HexColor('#1ABC00'),
//                       width: 2,
//                     )),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 0.2),
//                     ),
//                     hintStyle:
//                         TextStyle(fontSize: 18, color: Colors.grey.shade400)),
//               ));}
// }
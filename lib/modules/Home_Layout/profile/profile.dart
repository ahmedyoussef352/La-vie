import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromARGB(115, 33, 32, 32)),
          ),
          Image.asset(
            "assets/backgroundProfile.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(18),
            margin: EdgeInsets.only(top: 310),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#F3FEF1'),
                      ),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15,),
                          Image.asset('assets/coin.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('You have 30 points ',style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 75,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset('assets/edit.png'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Change Name ',
                              style: TextStyle(
                                  color: Colors.black,
                                  
                                  fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 75,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset('assets/edit.png'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Change Email ',
                              style: TextStyle(
                                  color: Colors.black,
                                  
                                  fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 90, left: MediaQuery.of(context).size.width / 2 - 100),
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white10,
                      child: Image.asset(
                        'assets/avtProfile.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
                ],
              ))
        ],
      ),
    );
  }
}

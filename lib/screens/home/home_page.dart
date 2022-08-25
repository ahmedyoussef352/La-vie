import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/modules/Home_Layout/Shop/shop.dart';
import 'package:odc/modules/Home_Layout/notification/notification.dart';
import 'package:odc/modules/Home_Layout/profile/posts.dart';
import 'package:odc/modules/Home_Layout/profile/profile.dart';
import 'package:odc/modules/Home_Layout/qr/qr.dart';
import '../../shared/styles/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 2;
  List<Widget> screens = [
    Posts(),
    QR(),
    MyWidget(),
    NotificationScreen(),
    Profile(),
    
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 4),
        color: DefeultGrey,
        child: CurvedNavigationBar(
          backgroundColor: DefeultGrey,
          buttonBackgroundColor: DefeultColor,
          color: Colors.white,
          index: currentIndex,
          animationCurve: Curves.ease,
          letIndexChange: (index) {
            setState(() {
              currentIndex = index;
            });

            
            return true;
          },
          items: <Widget>[
            Image.asset('assets/leave.png',
                color: currentIndex == 0
                    ? Colors.white
                    : Colors.black),
            Image.asset('assets/qr.png',
                color: currentIndex == 1
                    ? Colors.white
                    : Colors.black),
            Image.asset('assets/Home.png',
                color: currentIndex == 2
                    ? Colors.white
                    : Colors.black),
            Image.asset('assets/Bell.png',
                color: currentIndex == 3
                    ? Colors.white
                    : Colors.black),
            Image.asset('assets/Profile.png',
                color: currentIndex == 4
                    ? Colors.white
                    : Colors.black),
          ],
          // onTap: (index) {
          //   currentIndex(index);
          //   //Handle button tap
          // },
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

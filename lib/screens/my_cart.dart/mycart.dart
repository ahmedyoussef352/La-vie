import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/screens/home/home_page.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/single_item.dart';

import '../../widget/header.dart';

class MyCart extends StatefulWidget {
  bool empty = true ;
   MyCart({
    required this.empty

  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: widget.empty == true? emptyCart()
      : Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Header(label: 'My cart'),
            Container(
              height: 600,
              // color: Colors.grey.shade100,
              child: ListView(physics: BouncingScrollPhysics(), children: [
                SizedBox(height: 30),
                SingleItem(productImage: 'assets/Rectangle 15.png',
                  productName: 'Cactus plant',
                  productPrice: 500,),
                  SingleItem(productImage: 'assets/Rectangle 15.png',
                  productName: 'Cactus plant',
                  productPrice: 500,),
                  SingleItem(productImage: 'assets/Rectangle 15.png',
                  productName: 'Cactus plant',
                  productPrice: 500,),

              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '180,000 ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#1ABC00'),
                            ),
                          ),
                          Text(
                            'Egp',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#1ABC00'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  footer(),
                ],
              ),
            )
          ],
        ),
    ));
  }

  Widget emptyCart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/emptycart.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                        style: TextStyle(
                            fontSize: 17, color: Colors.grey.shade600),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      // padding: EdgeInsets.all(10),
      // margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: HexColor('#1ABC00'),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        child: Center(
          child: Text(
            'Checkout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          navigatTo(context, Home());
        },
      ),
    );
  }
}

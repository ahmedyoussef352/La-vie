import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:odc/shared/network/endPoint.dart';

import '../models/product_model.dart';
import '../shared/componant/constance.dart';
import '../shared/network/remote/Dio_Helper.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? getproduct;
  ProductModel? productData;
  void getProduct() async {
    print("get dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(token);
    await DioHelper.getdata(url: product, token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhMTU4OTczNi0zODA3LTQ2Y2EtOTM0MC02MDM0MWQ0N2Q5Y2EiLCJpYXQiOjE2NjEzMzI3ODIsImV4cCI6MTY2MTUwNTU4Mn0.DRnuyv2GSIpIDPABlvoSu5IJJH7sAvnXcqA6AWIGRUI").then((value) {
      productData = ProductModel.fromJson(value.data);
      print(productData);
      print("data");
      print(value);
    }).catchError((error) {
      print('ERROR');
      print(error.toString());
    });
  }
  addWishListData({
    required String wishListId,
    required String wishListName,
    required int wishListPrice,
    required String wishListImage,
    required int wishListQuantity,
     required List<dynamic> wishListUnit,
  }) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      "wishListUnit" : wishListUnit,
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishList":true,
      // "wishList": true,
    });
  }
}

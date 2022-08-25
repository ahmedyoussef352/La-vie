import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/screens/blog/blog_screen.dart';
import 'package:odc/screens/course_exam/exam_question1.dart';
import 'package:odc/screens/course_exam/exam_question6.dart';
import 'package:odc/screens/my_cart.dart/mycart.dart';
import 'package:provider/provider.dart';
import '../../../Providers/product_provider.dart';
import '../../../models/product_model.dart';
import '../../../shared/componant/componant.dart';
import '../../../shared/componant/constance.dart';
import '../../../shared/network/endPoint.dart';
import '../../../shared/network/remote/Dio_Helper.dart';
import '../../../shared/styles/colors.dart';
import '../search/search.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.getProduct();
    var searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 30,
                    width: 30,
                    child: InkWell(
                      onTap:() {
                        navigatTo(context, ExamQuestion1());
                      },
                      child: Icon(Icons.question_mark,color: Colors.white,),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(width: 100),
                  Center(child: Image.asset("assets/logo.png.png")),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 7,
                        child: InkWell(
                          onTap: () {
                            navigatTo(context, Search());
                          },
                          child: SearchDefult(
                              context: context,
                              isClickable: false,
                              onChange: (value) {
                                print(value);
                                return value;
                              },
                              searchController: searchController),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 55,
                        decoration: BoxDecoration(
                            color: DefeultColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {
                              navigatTo(context, MyCart(empty: false,));
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.grey.shade100,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 20,),
                  filterItem(name: 'All',onTap: (){}),
                  SizedBox(width: 20,),
                  filterItem(name: 'Cart',onTap: (){
                    navigatTo(context, MyCart(empty: true));
                  }),
                  SizedBox(width: 20,),
                  filterItem(name: 'Blog',onTap: (){
                    navigatTo(context, BlogScreen());
                  }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ConditionalBuilder(
                  condition: (productProvider.productData?.data != null),
                  builder: (BuildContext context) => defeultGridView(
                      productProvider.productData?.data?.length,
                      productProvider.productData?.data),
                  fallback: (BuildContext context) => Center(
                          child: CircularProgressIndicator(
                        color: DefeultColor,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}


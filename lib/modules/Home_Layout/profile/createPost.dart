import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';


class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            top: true,
            bottom: true,
            right: true,
            left: true,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              )),
                          Spacer(),
                          Text(
                            'Create New Post',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          SizedBox(width: 30)
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 130,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: DefeultColor,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 32,
                                color: DefeultColor,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Add photo",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: DefeultColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade200,
                          )
                        ),
                        child: DefoultformFild(
                          controller: titleController,
                          isPassword: false,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return "title is empty !";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(

                        child: TextField(
                          controller: descriptionController,
                          keyboardType: TextInputType.text,
                          maxLines: 7,
                          maxLength: 200,
                          decoration: InputDecoration(

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18.0,),
                      ConditionalBuilder(
                        condition: true,
                        builder: (BuildContext context) {
                          return defultButton(
                            context: context,
                            onpressed: () {},
                            text: "Post",
                          );
                        },
                        fallback: (BuildContext context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

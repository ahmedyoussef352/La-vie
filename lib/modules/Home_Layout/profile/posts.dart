import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';

import 'createPost.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigatTo(context, CreatePost());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: DefeultColor,
      ),
      body: ListView(children: [
        SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  'Discussion Forums',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                SizedBox(width: 30)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchDefult(
                  isClickable: true,
                  context: context,
                  onChange: (value) {
                    print(value);
                    return value;
                  },
                  searchController: searchController),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10 ,vertical: 10),
              child: Container(
                decoration: BoxDecoration(border: Border.all(
                  color: Colors.grey,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.values[0],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: DefeultGrey, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "mohamed waleed ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "1 day",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "post title here ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: DefeultColor),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  child: Text(
                                    "descriptionsdkgsmjgkjskgknrskngvnerajngrnrbndnbnerkngvkernbasdvlwJIGFWHJJ"
                                    "JFKLwrjvghgw4YEr7389744444444444444444444444444444444444444444444"
                                    "4444444444444444444444444444444444444444444444444445rkndrknbknadkbsksnksk"
                                    "akjfwekdgsbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbvamkka",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black38),
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/postimage.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 18,
                          color: Colors.grey,
                          icon: Image.asset("assets/like.png"),
                        ),
                        InkWell(
                            child: Text(
                          "40 likes",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            " 7 Replies",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      ],)
    );
    ;
  }
}

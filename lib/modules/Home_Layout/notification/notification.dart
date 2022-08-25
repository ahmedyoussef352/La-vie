import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/componant/componant.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                child: Center(child: Text("Notification",style: TextStyle(fontSize:20,fontWeight: FontWeight.w800,color: Colors.black),)),
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,int index)=> notifiItem()),
            ],
          ),
        ),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/product_model.dart';
import '../styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget pageViewItem(titlepageview model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Image(
        image: AssetImage(model.image),
      )),
      SizedBox(
        height: 15,
      ),
      Text(
        model.title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(model.desc),
    ],
  );
}

class titlepageview {
  late final String image;
  late final String title;
  late final String desc;
  titlepageview({required this.image, required this.title, required this.desc});
}

Future NavigatFinsh(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
      result: (rout) {
        return false;
      },
    );

Widget DefoultformFild({
  required TextEditingController controller,
  required TextInputType type,
  required bool isPassword,
  onsubmit,
  onChange,
  onTap,
  required validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  suffixfun,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      maxLines: 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: suffixfun, icon: Icon(suffix)),
      ),
    );
Widget defultButton({
  context,
  required onpressed,
  required String text,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DefeultColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        onPressed: onpressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
Widget defultTextButton({
  context,
  required onpressed,
  required String text,
}) =>
    TextButton(
      onPressed: onpressed,
      child: Text(
        text,
      ),
    );
void navigatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigatandFinish(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void showtoast({required String text, required toastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor(state: state),
        textColor: Colors.white,
        fontSize: 16.0);

enum toastStates { ERROR, WARRING, SUCESS }

Color? toastColor({toastStates? state}) {
  HexColor? color;
  switch (state) {
    case toastStates.ERROR:
      color = HexColor("EFAEAEA5");
      break;
    case toastStates.SUCESS:
      color = DefeultColor;
      break;
    case toastStates.WARRING:
      color = HexColor("F8C188FF");
      break;
    case null:
  }
  return color;
}

Widget SearchDefult({
  required context,
  required searchController,
  required Function onChange(value),
  ontap,
  required bool isClickable,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white)),
        child: TextFormField(
          controller: searchController,
          maxLines: 1,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Search can't be empty";
            }
            return null;
          },
          onTap: ontap,
          onChanged: onChange,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.0,
                  color: Colors.grey.shade100,
                ),
                borderRadius: BorderRadius.circular(14)),
            enabled: isClickable,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
            prefix: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );

Widget BottumDefult({
  onPresse,
  text,
}) =>
    Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPresse,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );

Widget plantItem(
    context,
    Data? Item,
    ) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
       
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                "https://lavie.orangedigitalcenteregypt.com${Item?.imageUrl}",
                height: 100,),
            ),

            Expanded(
              child: Text(
                "${Item?.name}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "${Item?.price} EGP",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5,),
            
            Container(
              // padding: EdgeInsets.all(10),
              // margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 35,
              decoration: BoxDecoration(
                color: HexColor('#1ABC00'),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                child: Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defeultGridView(length, Items) => Items != null
    ? GridView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return plantItem(context, Items[index]);
        },
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      )
    : CircularProgressIndicator();

Widget notifiItem() => Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 237, 204, 71),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/ogw/AOh-ky0wxcutoTzqtncVJBUqnCil8xA5CMd6vo5kLG8yGOY=s32-c-mo",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                child: Text(
                  '''Dennis Nedry commented on Isla Nublar SOC2 compliance report''',
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(left: 20),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor('#DDDEE1'),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      child: Expanded(
                        child: Text(
                            " leaves are an integral part of the stem system.\n "
                            "They are attached by a continuous vascular system to \nthe rest of the plant so that free exchange of nutrients."),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 20.0, bottom: 4),
            child: Text(
              "${DateTime.now()}),",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 4,
          )
        ],
      ),
    );
Widget filterItem({
  required name,
  required Function onTap,
}
  
) {
  bool isSelected = false;
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      padding: EdgeInsets.all(5),
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
        border: isSelected
            ? Border.all(color: DefeultColor, width: 1)
            : Border.all(color: Colors.black12),
      ),
      child: Center(
          child: Text(
        name,
        style: TextStyle(
          color: Colors.black38,
        ),
      )),
    ),
  );
}

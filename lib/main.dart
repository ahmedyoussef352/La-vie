import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:odc/screens/home/home_page.dart';
import 'package:odc/shared/componant/constance.dart';
import 'package:odc/shared/network/remote/Dio_Helper.dart';
import 'package:odc/shared/shared_preference/cachHelper.dart';
import 'package:odc/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/product_provider.dart';
import 'modules/Home_Layout/profile/createPost.dart';


void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  late Widget widget;
  token=CacheHelper.getdata(key: 'token')??'';
  if(token != null )widget=Home();
  else widget=Welcome();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'laVie';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
    ),
      ],
      child: MaterialApp(
                title: MyApp._title,
                debugShowCheckedModeBanner: false,
                home: Home()),
    );
  }
}

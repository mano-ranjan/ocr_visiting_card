import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocr_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // set your desired color
      statusBarIconBrightness:
          Brightness.light, // set to Brightness.dark for dark icons
      statusBarBrightness: Brightness.light, // for iOS
      systemNavigationBarColor: Colors.black, // navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // navigation bar icons color
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

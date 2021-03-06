import 'package:flutter/material.dart';
import 'screens/authen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);// มันคือ การหมุมหน้าจอ
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authen(),
    );
  }
}

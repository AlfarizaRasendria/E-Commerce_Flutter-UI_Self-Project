import 'package:flutter/material.dart';
import 'package:tes2/screens/BottomScreen.dart';
import 'package:tes2/screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping App",
      home: LoginScreens(),
    );
  }
}

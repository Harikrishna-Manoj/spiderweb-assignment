import 'package:flutter/material.dart';
import 'package:spiderweb_assignment/core/constant_colors.dart';
import 'package:spiderweb_assignment/presentaion/navigation_bar/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      home: NavBar(),
    );
  }
}

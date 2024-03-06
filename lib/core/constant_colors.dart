import 'package:flutter/material.dart';

Color commonScreenBlueColor = const Color.fromARGB(218, 203, 232, 255);
ThemeData appThemeData = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 131, 197, 251)),
  scaffoldBackgroundColor: commonScreenBlueColor,
  useMaterial3: true,
);

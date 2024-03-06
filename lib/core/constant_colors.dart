import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color commonScreenBlueColor = const Color.fromARGB(218, 203, 232, 255);
Color backBlueColor = Color.fromARGB(255, 203, 232, 255);

ThemeData appThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 131, 197, 251)),
    scaffoldBackgroundColor: commonScreenBlueColor,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily);

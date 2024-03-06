import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color commonScreenBlueColor = Color.fromARGB(218, 226, 241, 252);
const Color buttonBlueColor = Color.fromARGB(255, 105, 202, 202);

ThemeData appThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(218, 226, 241, 252)),
    scaffoldBackgroundColor: commonScreenBlueColor,
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily);

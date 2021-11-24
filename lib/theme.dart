import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
    brightness: Brightness.dark,
    // fontFamily: GoogleFonts.nunito().fontFamily,
    textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 18),
        bodyText2: TextStyle(fontSize: 16),
        button: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
        )));

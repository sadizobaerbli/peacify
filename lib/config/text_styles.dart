//==============custom text styles================
//------------------------------------------------
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class CustomTextStyle {
  static TextStyle regularText(double size,
          {Color color = CustomColors.black}) =>
      GoogleFonts.comfortaa(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
      );


  static TextStyle mediumText(double size,
          {Color color = CustomColors.black}) =>
      GoogleFonts.comfortaa(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle semiBoldText(double size,
          {Color color = CustomColors.black}) =>
      GoogleFonts.comfortaa(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      );

  static TextStyle boldText(double size, {Color color = CustomColors.black}) =>
      GoogleFonts.comfortaa(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w700,
      );

  static TextStyle extraBoldText(double size,
          {Color color = CustomColors.black}) =>
      GoogleFonts.comfortaa(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w900,
      );
}

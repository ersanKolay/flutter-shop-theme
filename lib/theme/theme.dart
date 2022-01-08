import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopTheme {
  ShopTheme._();

  static const Color xBrown = Color(0xff915e54);

  static ThemeData get theme => ThemeData(
        backgroundColor: Color(0xffffffff),
        scaffoldBackgroundColor: Colors.black,
        textTheme: textTheme,
      );

  static TextTheme get textTheme {
    return TextTheme(
      caption: GoogleFonts.merriweather(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: GoogleFonts.merriweather(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: GoogleFonts.merriweather(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: GoogleFonts.merriweather(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      bodyText2: GoogleFonts.merriweather(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline6: GoogleFonts.merriweather(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headline5: GoogleFonts.merriweather(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline4: GoogleFonts.merriweather(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headline3: GoogleFonts.merriweather(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headline2: GoogleFonts.merriweather(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headline1: GoogleFonts.merriweather(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}

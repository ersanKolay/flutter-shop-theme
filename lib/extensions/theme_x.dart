import 'package:flutter/material.dart';

extension TextThemeStylesX on BuildContext {
  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1!;

  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2!;

  TextStyle get subtitle1 => Theme.of(this).textTheme.subtitle1!;

  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2!;

  TextStyle get headline1 => Theme.of(this).textTheme.headline1!;

  TextStyle get headline2 => Theme.of(this).textTheme.headline2!;

  TextStyle get headline3 => Theme.of(this).textTheme.headline3!;

  TextStyle get headline4 => Theme.of(this).textTheme.headline4!;

  TextStyle get headline5 => Theme.of(this).textTheme.headline5!;

  TextStyle get headline6 => Theme.of(this).textTheme.headline6!;
}

extension SizeX on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension calculateHeight on double {
  double newHeight(value) {
    if (value < 0.5) {
      return this * value;
    } else {
      return this - (this * value);
    }
  }
}

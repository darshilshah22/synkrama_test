import 'package:flutter/material.dart';

class BSizes {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  static const double appBarHeight = 76.0;

  static const double smallSpace = 8.0;
  static const double mediumSpace = 12.0;
  static const double defaultSpace = 16.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 24.0;

  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;
  static const double borderRadiusXl = 14.0;
  static const double borderRadiusAppbar = 50.0;

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

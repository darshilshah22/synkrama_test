import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/fonts_family_constants.dart';

class BTextTheme {
  BTextTheme._();

  static TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.w800,
      color: ColorConstants.textLight,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.w600,
      color: ColorConstants.textLight,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.w500,
      color: ColorConstants.textLight,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.w600,
      color: ColorConstants.textLight,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.normal,
      color: ColorConstants.textLight,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.w400,
      color: ColorConstants.textLight,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.w400,
      color: ColorConstants.textLight,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontFamily: FontFamilyConstants.poppins,
      fontWeight: FontWeight.normal,
      color: ColorConstants.textLight,
    ),
  );

  static TextStyle priceTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: FontFamilyConstants.poppins,
    fontWeight: FontWeight.w600,
    color: ColorConstants.textLight,
  );

  static TextStyle detailsTitleStyle = TextStyle(
    fontSize: 14,
    fontFamily: FontFamilyConstants.poppins,
    fontWeight: FontWeight.w600,
    color: ColorConstants.textLight,
  );

  static TextStyle bigTitle = TextStyle(
    fontSize: 16,
    fontFamily: FontFamilyConstants.poppins,
    fontWeight: FontWeight.w500,
    color: ColorConstants.textLight,
  );

  static TextStyle mediumTitle = TextStyle(
    fontSize: 16,
    fontFamily: FontFamilyConstants.poppins,
    fontWeight: FontWeight.w600,
    color: ColorConstants.primaryColor,
  );

  static TextStyle smallTitle = TextStyle(
    fontSize: 12,
    fontFamily: FontFamilyConstants.poppins,
    fontWeight: FontWeight.w600,
    color: ColorConstants.primaryColor,
  );
}

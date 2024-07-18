import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/textfield_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConstants.bgColor,
    primaryColor: ColorConstants.primaryColor,
    inputDecorationTheme: BTextFormFieldTheme.inputDecorationTheme,
    textTheme: BTextTheme.textTheme,
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: WidgetStateProperty.all(Colors.white),
    ),
  );
}

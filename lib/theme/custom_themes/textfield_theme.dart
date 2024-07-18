import 'package:flutter/material.dart';
import 'package:synkrama_test/theme/sizes.dart';

import '../../constants/color_constants.dart';

class BTextFormFieldTheme {
  BTextFormFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 4,
    prefixIconColor: ColorConstants.textLight,
    suffixIconColor: ColorConstants.textLight,
    alignLabelWithHint: true,
    fillColor: ColorConstants.bgColor1,
    filled: true,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.textLight,
    ),
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstants.textLight.withOpacity(0.5),
    ),
    errorStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal,
        fontSize: 14,
        color: ColorConstants.errorRed),
    floatingLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorConstants.textLight,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineInputBorder.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: BSizes.spaceBtwSections,
      vertical: BSizes.defaultSpace,
    ),
    disabledBorder: outlineInputBorder,
    focusedErrorBorder: outlineInputBorder.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
  );

  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      width: 1,
      color: Colors.transparent,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:synkrama_test/constants/color_constants.dart';
import 'package:synkrama_test/theme/sizes.dart';

import '../theme/custom_themes/text_theme.dart';

PreferredSizeWidget customAppBar(BuildContext context,
    {String title = "", required bool isPop, List<Widget>? actions}) {
  double height = MediaQuery.of(context).size.height;
  return PreferredSize(
    preferredSize: Size.fromHeight(height * 0.11),
    child: SafeArea(
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(
            horizontal: BSizes.sm, vertical: BSizes.sm),
        decoration: BoxDecoration(
            color: ColorConstants.bgColor2,
            borderRadius: BorderRadius.circular(50)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                if (isPop)
                  Align(
                      alignment: Alignment.centerLeft,
                      child: buildIcon(context)),
                if(title.isNotEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: BTextTheme.textTheme.titleMedium!
                        .copyWith(fontSize: 20),
                  ),
                ),
                if (actions != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        // Handle search button press
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildIcon(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(BSizes.md - 2),
    decoration: BoxDecoration(
      color: ColorConstants.bgColor1,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.arrow_back_rounded,
      color: Colors.white,
      size: BSizes.xl,
    ),
  );
}

Widget buildTextField(
    {required TextEditingController controller,
    required String hint,
    bool isSuffix = false,
    bool isObscure = false,
    TextInputType? keyboardType,
    VoidCallback? onSuffixTap}) {
  return TextFormField(
    style: BTextTheme.detailsTitleStyle,
    cursorColor: ColorConstants.textLight,
    obscureText: isObscure,
    keyboardType: keyboardType ?? TextInputType.text,
    decoration: InputDecoration(
      hintText: hint,
      suffixIcon: isSuffix ? InkWell(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: onSuffixTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: ColorConstants.textLight.withOpacity(0.5),
          ),
        ),
      ) : const SizedBox(),
    ),
  );
}

Widget buttonWidget(
    {required String title, Color? color, required VoidCallback onTap}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.all(BSizes.defaultSpace - 4),
    decoration: BoxDecoration(
        color: color ?? ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(60)),
    child: Text(
      title,
      style: BTextTheme.bigTitle.copyWith(
          color: ColorConstants.textDark, fontWeight: FontWeight.w600),
    ),
  );
}

Widget customInkwell({required Widget child, void Function()? onTap}) {
  return InkWell(
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    onTap: onTap,
    child: child,
  );
}

import 'package:flutter/material.dart';
import 'package:synkrama_test/constants/helpers.dart';

import '../constants/color_constants.dart';
import '../theme/custom_themes/text_theme.dart';
import '../theme/sizes.dart';
import '../widgets/common_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cfPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customInkwell(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(bottom: BSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: "You already have an account? ",
                  style: BTextTheme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: " Sign In",
                      style: BTextTheme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                top: BSizes.spaceBtwSections * 2,
                left: BSizes.defaultSpace,
                right: BSizes.defaultSpace,
                bottom: BSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Let's create your account!",
                  textAlign: TextAlign.center,
                  style: BTextTheme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 36, height: 1.4),
                ),
                const SizedBox(height: BSizes.smallSpace),
                Text(
                  "Let's jump to the shopping",
                  textAlign: TextAlign.center,
                  style: BTextTheme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: BSizes.spaceBtwSections * 2),
                buildTextField(controller: nameController, hint: "Name"),
                const SizedBox(height: BSizes.defaultSpace),
                buildTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hint: "Email",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter email";
                    } else if (!val.isValidEmail()) {
                      return "Please enter valid email";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: BSizes.defaultSpace),
                buildTextField(
                  controller: passwordController,
                  hint: "Password",
                  isSuffix: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter password";
                    } else if (validatePassword(val) != null) {
                      return validatePassword(val);
                    }

                    return null;
                  },
                ),
                const SizedBox(height: BSizes.defaultSpace),
                buildTextField(
                  controller: cfPasswordController,
                  hint: "Confirm password",
                  isSuffix: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter confirm password";
                    } else if (val != passwordController.text) {
                      return "Password and Confirm password should be matched";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: BSizes.defaultSpace * 2),
                buttonWidget(title: "Sign In", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

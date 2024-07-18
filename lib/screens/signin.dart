import 'package:flutter/material.dart';
import 'package:synkrama_test/constants/color_constants.dart';
import 'package:synkrama_test/routing/routes.dart';
import 'package:synkrama_test/theme/custom_themes/text_theme.dart';
import 'package:synkrama_test/theme/sizes.dart';

import '../widgets/common_widgets.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(context, title: "Sign In", isPop: false),
      bottomNavigationBar: customInkwell(
        onTap: () {
          Navigator.pushNamed(context, Routes.signUpRoute);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: BSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: BTextTheme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: " Sign Up",
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
              bottom: BSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello Again!",
                  style: BTextTheme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: BSizes.smallSpace),
                Text(
                  "Welcome back you've\nbeen missed!",
                  textAlign: TextAlign.center,
                  style: BTextTheme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: BSizes.spaceBtwSections * 2),
                buildTextField(controller: emailController, hint: "Email"),
                const SizedBox(height: BSizes.defaultSpace),
                buildTextField(
                    controller: passwordController,
                    hint: "Password",
                    isSuffix: true),
                const SizedBox(height: BSizes.defaultSpace * 2),
                buttonWidget(title: "Sign In", onTap: () {}),
                const SizedBox(height: BSizes.sm + 2),
                buildForgotPassword(),
                const SizedBox(height: BSizes.defaultSpace * 2),
                buildSocialLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForgotPassword() {
    return Container(
      margin: const EdgeInsets.only(right: BSizes.defaultSpace + 4),
      alignment: Alignment.bottomRight,
      child: Text(
        "Forgot Password?",
        style: BTextTheme.textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorConstants.primaryColor,
        ),
      ),
    );
  }

  Widget buildSocialLogin() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: Divider(
              color: Colors.white54,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: BSizes.defaultSpace),
              child: Text("Or"),
            ),
            Expanded(
                child: Divider(
              color: Colors.white54,
            )),
          ],
        ),
        const SizedBox(height: BSizes.defaultSpace * 2),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(BSizes.defaultSpace - 4),
          decoration: BoxDecoration(
              color: ColorConstants.bgColor1,
              borderRadius: BorderRadius.circular(60)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/google.png",
                height: 24,
              ),
              const SizedBox(width: BSizes.defaultSpace),
              const Text("Continue with Google")
            ],
          ),
        )
      ],
    );
  }
}

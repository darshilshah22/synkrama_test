import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synkrama_test/constants/helpers.dart';
import 'package:synkrama_test/prefs/prefs_functions.dart';
import 'package:synkrama_test/providers/signup_provider.dart';

import '../constants/color_constants.dart';
import '../constants/constants.dart';
import '../models/user_model.dart';
import '../prefs/prefs.dart';
import '../routing/routes.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    usersList = await PreferenceHelper.getUsers() ?? [];
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cfPasswordController.dispose();
    super.dispose();
  }

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
            child: Form(
              key: _formKey,
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
                  buildTextField(
                    controller: nameController,
                    hint: "Name",
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter name";
                      }

                      return null;
                    },
                  ),
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
                  Consumer<SignupProvider>(builder: (context, value, child) {
                    return buildTextField(
                      controller: passwordController,
                      hint: "Password",
                      isSuffix: true,
                      isObscure: value.isPassObscure,
                      onSuffixTap: () {
                        context
                            .read<SignupProvider>()
                            .setPassObscure(!value.isPassObscure);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter password";
                        } else if (validatePassword(val) != null) {
                          return validatePassword(val);
                        }

                        return null;
                      },
                    );
                  }),
                  const SizedBox(height: BSizes.defaultSpace),
                  Consumer<SignupProvider>(builder: (context, value, child) {
                    return buildTextField(
                      controller: cfPasswordController,
                      hint: "Confirm password",
                      isSuffix: true,
                      isObscure: value.isCfPassObscure,
                      keyboardType: TextInputType.visiblePassword,
                      onSuffixTap: () {
                        context
                            .read<SignupProvider>()
                            .setCfPassObscure(!value.isCfPassObscure);
                      },
                      validator: (val) {
                        log(passwordController.text);
                        if (val!.isEmpty) {
                          return "Please enter confirm password";
                        } else if (val != passwordController.text) {
                          return "Password and Confirm password should be matched";
                        }

                        return null;
                      },
                    );
                  }),
                  const SizedBox(height: BSizes.defaultSpace * 2),
                  buttonWidget(
                      title: "Sign In",
                      onTap: () {
                        validation();
                      }),
                  const SizedBox(height: BSizes.defaultSpace),
                  Consumer<SignupProvider>(builder: (context, value, child) {
                    return customInkwell(
                      onTap: () {
                        context.read<SignupProvider>().setCheck(!value.isCheck);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          value.isCheck
                              ? const Icon(Icons.check_box_outlined)
                              : const Icon(
                                  Icons.check_box_outline_blank_rounded),
                          const SizedBox(width: BSizes.defaultSpace / 2),
                          Text(
                            "Please accept terms and conditions",
                            textAlign: TextAlign.center,
                            style: BTextTheme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validation() async {
    if (_formKey.currentState!.validate()) {
      if (Provider.of<SignupProvider>(context, listen: false).isCheck) {
        if (usersList.any((e) => e.email == emailController.text)) {
          showToast(
            title: 'Email exists',
            description: 'Email is already registered. Please Sign In.',
          );
        } else {
          User user = User(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text);
          usersList.add(user);
          Preferences.setBool('login', true);
          await PreferenceHelper.setUser(user);
          await PreferenceHelper.setUsers(usersList);
          showToast(
              title: 'User Registered',
              description: 'User is registered successfully',
              isError: false);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.bottomRoute, (route) => false);
        }
      } else {
        showToast(
          title: 'Accept Terms & Conditions',
          description: 'Please accept terms and conditions',
        );
      }
    }
  }
}

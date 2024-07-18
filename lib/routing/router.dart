import 'package:flutter/material.dart';
import 'package:synkrama_test/routing/routes.dart';
import 'package:synkrama_test/screens/signin.dart';

import '../screens/signup.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInRoute:
        return _getMaterialPageRoute(const Signin());
      case Routes.signUpRoute:
        return _getMaterialPageRoute(const SignUp());
      // case Routes.forgotPasswordRoute:
      //   return _getMaterialPageRoute(const ForgotPassword());
      // case Routes.otpRoute:
      //   OtpArguments args = settings.arguments as OtpArguments;
      //   return _getMaterialPageRoute(OTPScreen(
      //     mobile: args.mobile as String,
      //     isFrom: args.isFrom as String,
      //     password: args.password as String,
      //     userId: args.userId as String,
      //   ));
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}

PageRoute _getMaterialPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (BuildContext context) => child,
  );
}
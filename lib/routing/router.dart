import 'package:flutter/material.dart';
import 'package:synkrama_test/routing/routes.dart';
import 'package:synkrama_test/screens/bottom_nav.dart';
import 'package:synkrama_test/screens/signin.dart';

import '../screens/signup.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInRoute:
        return _getPageRoute(const Signin(), settings);
      case Routes.signUpRoute:
        return _getPageRoute(const SignUp(), settings);
      case Routes.bottomRoute:
        return _getPageRoute(const BottomNav(), settings);
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

  static PageRoute _getPageRoute(Widget child, RouteSettings settings) {
    return _FadeRoute(
        child: child, routeName: settings.name!, arguments: settings.arguments);
  }
}


class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;
  final Object? arguments;

  _FadeRoute({this.child, this.routeName, this.arguments})
      : super(
          settings: RouteSettings(name: routeName, arguments: arguments),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

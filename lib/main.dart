import 'package:flutter/material.dart';
import 'package:synkrama_test/theme/theme.dart';

import 'routing/router.dart';
import 'routing/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.signInRoute,
      onGenerateRoute: PageRouter.generateRoute,
      theme: MyAppTheme.appTheme,
      scrollBehavior: MyBehavior(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
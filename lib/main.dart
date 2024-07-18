import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synkrama_test/providers/signin_provider.dart';
import 'package:synkrama_test/providers/signup_provider.dart';
import 'package:synkrama_test/screens/bottom_nav.dart';
import 'package:synkrama_test/screens/signin.dart';
import 'package:synkrama_test/theme/theme.dart';
import 'package:toastification/toastification.dart';

import 'prefs/prefs.dart';
import 'routing/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLogin = false;

  @override
  void initState() {
    getLoginCheck();
    super.initState();
  }

  getLoginCheck() async {
    isLogin = await Preferences.getBool("login");
    print(isLogin);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLogin ? const BottomNav() : const Signin(),
          onGenerateRoute: PageRouter.generateRoute,
          theme: MyAppTheme.appTheme,
          scrollBehavior: MyBehavior(),
        ),
      ),
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

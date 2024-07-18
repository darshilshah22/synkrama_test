import 'package:flutter/material.dart';
import 'package:synkrama_test/widgets/common_widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, isPop: false, title: "Profile"),
    );
  }
}
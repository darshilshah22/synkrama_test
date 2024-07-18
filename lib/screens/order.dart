import 'package:flutter/material.dart';
import 'package:synkrama_test/widgets/common_widgets.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, isPop: false, title: "Orders"),
    );
  }
}
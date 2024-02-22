import 'package:flutter/material.dart';
import 'package:pizza_app/utils/app_bar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('This is the cart page'),
        )
      ),
    );
  }
}

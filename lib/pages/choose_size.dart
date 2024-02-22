import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/button_default.dart';
import 'package:pizza_app/widgets/button_selected.dart';
import 'package:pizza_app/widgets/pizza_option_stack.dart';
import 'package:provider/provider.dart';

class ChooseSize extends StatefulWidget {
  const ChooseSize({super.key});

  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  @override
  Widget build(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);
    providerCart.setDefaultSize();

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PizzaOptionStack(type: 'size'),
            // Card (3 options)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: const EdgeInsets.only(top: 35, right: 20, bottom: 35, left: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/choose_size.png'), // Choose your size text
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: switch (providerCart.size) {
                        'sm'      => smallSelected(context),
                        'lg'      => largeSelected(context),
                        String()  => mediumSelected(context),
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 75.0), // reserved space for floating button action
          ],
        ),
      ),
      floatingActionButton: ActionButton(
        label: 'Next',
        onPressed: () {
          // providerCart.update();
          Navigator.of(context).pushNamed('/crust');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> smallSelected(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    return <Widget>[
      SelectedButton(
        label: sizeLabels['sm']!,
        onPressed: () => providerCart.size = 'sm'
      ),
      DefaultButton(
        label: sizeLabels['md']!,
        onPressed: () => providerCart.size = 'md'
      ),
      DefaultButton(
        label: sizeLabels['lg']!,
        onPressed: () => providerCart.size = 'lg'
      ),
    ];
  }

  List<Widget> mediumSelected(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    return <Widget>[
      DefaultButton(
        label: sizeLabels['sm']!,
        onPressed: () => providerCart.size = 'sm'
      ),
      SelectedButton(
        label: sizeLabels['md']!,
        onPressed: () => providerCart.size = 'md'
      ),
      DefaultButton(
        label: sizeLabels['lg']!,
        onPressed: () => providerCart.size = 'lg'
      ),
    ];
  }

  List<Widget> largeSelected(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    return <Widget>[
      DefaultButton(
        label: sizeLabels['sm']!,
        onPressed: () => providerCart.size = 'sm'
      ),
      DefaultButton(
        label: sizeLabels['md']!,
        onPressed: () => providerCart.size = 'md'
      ),
      SelectedButton(
        label: sizeLabels['lg']!,
        onPressed: () => providerCart.size = 'lg'
      ),
    ];
  }
}

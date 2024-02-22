import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/button_default.dart';
import 'package:pizza_app/widgets/button_selected.dart';
import 'package:pizza_app/widgets/pizza_option_stack.dart';
import 'package:provider/provider.dart';

class ChooseCrust extends StatefulWidget {
  const ChooseCrust({super.key});

  @override
  State<ChooseCrust> createState() => _ChooseCrustState();
}

class _ChooseCrustState extends State<ChooseCrust> {
  @override
  Widget build(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);
    providerCart.setDefaultCrust();

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PizzaOptionStack(type: 'crust'),
            // Card (3 options)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: const EdgeInsets.all(35.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/choose_crust.png'), // Choose your crust text
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: switch (providerCart.crust) {
                        'thick'   => thickSelected(context),
                        String()  => thinSelected(context),
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
          Navigator.of(context).pushNamed('/toppings');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> thinSelected(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    return <Widget>[
      SelectedButton(
        label: crustLabels['thin']!,
        onPressed: () => providerCart.crust = 'thin'
      ),
      DefaultButton(
        label: crustLabels['thick']!,
        onPressed: () => providerCart.crust = 'thick'
      ),
    ];
  }

  List<Widget> thickSelected(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    return <Widget>[
      DefaultButton(
        label: crustLabels['thin']!,
        onPressed: () => providerCart.crust = 'thin'
      ),
      SelectedButton(
        label: crustLabels['thick']!,
        onPressed: () => providerCart.crust = 'thick'
      ),
    ];
  }
}

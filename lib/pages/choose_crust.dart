import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/button_default.dart';
import 'package:pizza_app/widgets/button_selected.dart';
import 'package:pizza_app/widgets/pizza_option_stack.dart';

class ChooseCrust extends StatefulWidget {
  const ChooseCrust({super.key});

  @override
  State<ChooseCrust> createState() => _ChooseCrustState();
}

class _ChooseCrustState extends State<ChooseCrust> {
  String selectedSize = 'md';
  String selectedCrust = 'thin';

  @override
  Widget build(BuildContext context) {
    final double cost = prizes[selectedSize]! + crusts[selectedCrust]!;

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PizzaOptionStack(
              type: 'crust',
              size: selectedSize,
              crust: selectedCrust,
              prize: cost
            ),
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
                    Image.asset('assets/images/choose_size.png'), // Choose your size text
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: switch (selectedCrust) {
                        'thick'   => thickSelected,
                        String()  => thinSelected,
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
          debugPrint('Go to /toppings');
          // TODO: Navigator.of(context).pushNamed('/toppings');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> get thinSelected {
    return <Widget>[
      SelectedButton(
        label: crustLabels['thin']!,
        onPressed: () => setState(() => selectedCrust = 'thin')
      ),
      DefaultButton(
        label: crustLabels['thick']!,
        onPressed: () => setState(() => selectedCrust = 'thick')
      ),
    ];
  }

  List<Widget> get thickSelected {
    return <Widget>[
      DefaultButton(
        label: crustLabels['thin']!,
        onPressed: () => setState(() => selectedCrust = 'thin')
      ),
      SelectedButton(
        label: crustLabels['thick']!,
        onPressed: () => setState(() => selectedCrust = 'thick')
      ),
    ];
  }
}

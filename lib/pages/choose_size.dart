import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/button_default.dart';
import 'package:pizza_app/widgets/button_selected.dart';
import 'package:pizza_app/widgets/pizza_option_stack.dart';

class ChooseSize extends StatefulWidget {
  const ChooseSize({super.key});

  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  String selectedSize = 'md';
  String selectedCrust = 'thin';

  @override
  Widget build(BuildContext context) {
    double cost = prizes[selectedSize]!;

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PizzaOptionStack(
              type: 'size',
              size: selectedSize,
              crust: selectedCrust,
              prize: cost,
            ),
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
                      children: switch (selectedSize) {
                        'sm'      => smallSelected,
                        'lg'      => largeSelected,
                        String()  => mediumSelected,
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
          Navigator.of(context).pushNamed('/crust');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> get smallSelected {
    return <Widget>[
      SelectedButton(
        label: sizeLabels['sm']!,
        onPressed: () => setState(() => selectedSize = 'sm')
      ),
      DefaultButton(
        label: sizeLabels['md']!,
        onPressed: () => setState(() => selectedSize = 'md')
      ),
      DefaultButton(
        label: sizeLabels['lg']!,
        onPressed: () => setState(() => selectedSize = 'lg')
      ),
    ];
  }

  List<Widget> get mediumSelected {
    return <Widget>[
      DefaultButton(
        label: sizeLabels['sm']!,
        onPressed: () => setState(() => selectedSize = 'sm')
      ),
      SelectedButton(
        label: sizeLabels['md']!,
        onPressed: () => setState(() => selectedSize = 'md')
      ),
      DefaultButton(
        label: sizeLabels['lg']!,
        onPressed: () => setState(() => selectedSize = 'lg')
      ),
    ];
  }

  List<Widget> get largeSelected {
    return <Widget>[
      DefaultButton(
        label: sizeLabels['sm']!,
        onPressed: () => setState(() => selectedSize = 'sm')
      ),
      DefaultButton(
        label: sizeLabels['md']!,
        onPressed: () => setState(() => selectedSize = 'md')
      ),
      SelectedButton(
        label: sizeLabels['lg']!,
        onPressed: () => setState(() => selectedSize = 'lg')
      ),
    ];
  }
}

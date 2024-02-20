import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/arc_downward.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/button_default.dart';
import 'package:pizza_app/widgets/button_selected.dart';

class ChooseSize extends StatefulWidget {
  const ChooseSize({super.key});

  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  String selectedSize = 'md';

  @override
  Widget build(BuildContext context) {
    var meta = imageMeta[selectedSize];

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  // Semi-circle arc
                  Positioned(
                    left: (MediaQuery.of(context).size.width / 2) - meta['arc']['radius'],
                    top: meta['arc']['top'],
                    child: ArcDownward(diameter: meta['arc']['diameter']),
                  ),
                  // Half BG / Hero section
                  Container(
                    padding: const EdgeInsets.all(25.0),
                    width: double.infinity,
                    height: 287.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffFFA360),
                          Color(0xffF5313F),
                        ],
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Create Your Pizza', style: textHeader1(color: Colors.white)),
                            Text(
                              '\$${prizes[selectedSize]!.toStringAsFixed(2)}',
                              style: textHeader2(color: Colors.white)
                            ),
                          ],
                        ),
                        Text(
                          'size, crust, toppings'.toUpperCase(),  // TODO: this text should be changed according to selection
                          style: textPreTitle(color: Colors.white.withOpacity(0.3))
                        ),
                      ],
                    ),
                  ),
                  // Pizza image
                  Positioned(
                    left: (MediaQuery.of(context).size.width / 2) - meta['img']['radius'],
                    top: meta['img']['top'],
                    child: Image.asset('assets/images/pizza_$selectedSize.png'),
                  ),
                  // Size label
                  Positioned(
                    left: (MediaQuery.of(context).size.width / 2) - meta['label']['radius'],
                    bottom: meta['label']['bottom'],
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      width: 49.34,
                      decoration: const BoxDecoration(
                        color: Color(0xffDADAE5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Text(
                        '${sizes[selectedSize]}"',
                        style: textPreTitle(color: const Color(0xffA0A8CC)),
                        textAlign: TextAlign.center
                      ),
                    ),
                  )
                ],
              ),
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
        label: 'Small',
        onPressed: () => setState(() => selectedSize = 'sm')
      ),
      DefaultButton(
        label: 'Medium',
        onPressed: () => setState(() => selectedSize = 'md')
      ),
      DefaultButton(
        label: 'Large',
        onPressed: () => setState(() => selectedSize = 'lg')
      ),
    ];
  }

  List<Widget> get mediumSelected {
    return <Widget>[
      DefaultButton(
        label: 'Small',
        onPressed: () => setState(() => selectedSize = 'sm')
      ),
      SelectedButton(
        label: 'Medium',
        onPressed: () => setState(() => selectedSize = 'md')
      ),
      DefaultButton(
        label: 'Large',
        onPressed: () => setState(() => selectedSize = 'lg')
      ),
    ];
  }

  List<Widget> get largeSelected {
    return <Widget>[
      DefaultButton(
        label: 'Small',
        onPressed: () => setState(() => selectedSize = 'sm')
      ),
      DefaultButton(
        label: 'Medium',
        onPressed: () => setState(() => selectedSize = 'md')
      ),
      SelectedButton(
        label: 'Large',
        onPressed: () => setState(() => selectedSize = 'lg')
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/arc_downward.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/button_default.dart';
import 'package:pizza_app/widgets/button_selected.dart';

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
    final Map<String, dynamic> meta = imageMeta[selectedSize];
    final double cost = prizes[selectedSize]! + crusts[selectedCrust]!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Color(0xff6D6E9C)),
        ),
        title: Text(
          'Uncle John Pizzas',
          style: textTitleLight(color: const Color(0xff6D6E9C))
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xff6D6E9C)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 20)
        ],
      ),
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
                              '\$${cost.toStringAsFixed(2)}',
                              style: textHeader2(color: Colors.white)
                            ),
                          ],
                        ),
                        Text(
                          'medium, crust, toppings'.toUpperCase(), // TODO: this text should be changed according to selection
                          style: textPreTitle(color: Colors.white.withOpacity(0.3))
                        ),
                      ],
                    ),
                  ),
                  // Pizza image
                  Positioned(
                    left: (MediaQuery.of(context).size.width / 2) - meta['img']['radius'],
                    top: meta['img']['top'],
                    child: Image.asset('assets/images/pizza_$selectedCrust.png'),
                  ),
                  // Size label
                  Positioned(
                    left: (MediaQuery.of(context).size.width / 2) - meta['label']['radius'],
                    bottom: meta['label']['bottom'],
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      width: 62,
                      decoration: const BoxDecoration(
                        color: Color(0xffDADAE5),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Text(
                        '+\$${crusts[selectedCrust]!.toStringAsFixed(2)}"',
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
        label: 'Thin',
        onPressed: () => setState(() => selectedCrust = 'thin')
      ),
      DefaultButton(
        label: 'Thick',
        onPressed: () => setState(() => selectedCrust = 'thick')
      ),
    ];
  }

  List<Widget> get thickSelected {
    return <Widget>[
      DefaultButton(
        label: 'Thin',
        onPressed: () => setState(() => selectedCrust = 'thin')
      ),
      SelectedButton(
        label: 'Thick',
        onPressed: () => setState(() => selectedCrust = 'thick')
      ),
    ];
  }
}

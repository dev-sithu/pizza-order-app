import 'package:flutter/material.dart';
import 'package:pizza_app/utils/typography.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        leading: GestureDetector(
          onTap: () => {
            debugPrint('Leading icon clicked!')
          },
          child: const Icon(Icons.menu),
        ),
        title: GestureDetector(
          onTap: () => {
            debugPrint('Title clicked!')
          },
          child: RichText(
          text: TextSpan(
            text: 'Delivery To:',
            style: textBody(),
            children: <TextSpan>[
              TextSpan(text: '\nHOME', style: textPreTitle()),
            ]),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              debugPrint('Action icon clicked');
            },
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Half BG / Hero section
            Container(
              width: double.infinity,
              height: 152,
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
              // Header
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20, bottom: 2),
                    child: Text('Good Day!', style: textBody(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: VerticalDivider(color: Colors.white, thickness: 2),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'What',
                              style: textHeader1(color: Colors.white),
                              children: [
                                TextSpan(text: ' pizza', style: textHeader2()),
                                TextSpan(text: ' do you\nwant to try today?', style: textHeader1())
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card / Reorder
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 218,
                transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/thinCrust_w_ toppings_1.png'),
                    Flexible( // for word-wrap
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Reorder again?', style: textHeader4(color: const Color(0xffF5313F))),
                          Text('Small, thin crust, tomatoes, basil, cheese'.toUpperCase(), style: textPreTitle()),
                          const SizedBox(height: 5),
                          Text('\$12', style: textHeader4()),
                          const SizedBox(height: 8),
                          MaterialButton(
                            onPressed: () {
                              debugPrint('Add To Cart clicked!');
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: const EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xffFFA360),
                                    Color(0xffF5313F),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 123.0, minHeight: 38.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Add To Cart',
                                  textAlign: TextAlign.center,
                                  style: textBodyBold(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
            // Card / Create Pizza
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 45),
                      Image.asset('assets/images/create_your_own_pizza.png'),
                      const SizedBox(height: 5),
                      Text('The cost will depend on your customization'.toUpperCase(), style: textPreTitle(color: const Color(0xffA0A8CC))),
                      Image.asset('assets/images/thickCrust_w_ toppings_w_ toppings_02_1.png'),
                    ],
                  ),
                ),
                onTap: () {
                  debugPrint('go to the screen to choose size!');
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/pizza_option_stack.dart';
import 'package:provider/provider.dart';

class ChooseToppings extends StatefulWidget {
  const ChooseToppings({super.key});

  @override
  State<ChooseToppings> createState() => _ChooseToppingsState();
}

class _ChooseToppingsState extends State<ChooseToppings> {
  @override
  Widget build(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);
    providerCart.setDefaultCrust();

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PizzaOptionStack(type: 'topping'),
            // Choose Toppings
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.only(top: 25.0, right: 35.0, bottom: 25.0, left: 35.0),
                    width: double.infinity,
                    height: 181.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/choose_toppings.png'), // Choose up to 7 toppings text
                        const SizedBox(height: 5),
                        Text('Free 3 add-ons'.toUpperCase(), style: textPreTitle(color: const Color(0xffA0A8CC))),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 68.0),
                  child: toppingSelectionSlider(context),
                ),
              ],
            ) // Choose Toppings
          ],
        ),
      ),
      floatingActionButton: ActionButton(
        label: 'Done',
        onPressed: () {
          debugPrint('Go to the cart page');
          // TODO: Navigator.of(context).pushNamed('/cart');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  CarouselSlider toppingSelectionSlider(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);
    List<Topping> toppings = providerCart.toppings;

    return CarouselSlider(
      options: CarouselOptions(
        height: 106.0,
        enableInfiniteScroll: false
      ),
      items: ingredients.keys.map((key) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffDADAE5),
                  width: 0.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                boxShadow: const [
                  BoxShadow( // box-shadow: 0px 4px 15px 0px rgba(218, 218, 229, 0.7);
                    offset: Offset(0, 4),
                    blurRadius: 15,
                    spreadRadius: 0,
                    color: Color.fromRGBO(218, 218, 229, 0.7),
                  )
                ],
                //
                color: Colors.white
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/ingredients/${key.toString().toLowerCase()}.png'),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${ingredients[key]['name']}', style: textBodyBold()),
                        Text('+ \$${ingredients[key]['prize'].toStringAsFixed(2)}', style: textBody())
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center( // Custom checkbox
                      child: InkWell(
                        onTap: () {
                          if (toppings.contains(key)) {
                            toppings.remove(key);
                          } else {
                            toppings.add(key);
                          }

                          providerCart.toppings = toppings;
                        },
                        child: providerCart.toppings.contains(key)
                          ? Image.asset('assets/images/checkbox-checked.png', width: 40)
                          : Image.asset('assets/images/checkbox-unchecked.png', width: 40),
                      )
                    ) // Custom checkbox
                  )
                ],
              )
            );
          },
        );
      }).toList(),
    );
  }
}

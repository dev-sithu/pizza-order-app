import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/utils/box.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();

    // Reference: https://stackoverflow.com/a/49458289/1179841
    Future.delayed(Duration.zero, () {
      final providerCart = Provider.of<CartProvider>(context, listen: false);
      if (providerCart.cartIsEmpty()) {
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    if (providerCart.cartIsEmpty()) {
      return Scaffold(
        appBar: appBarMain(context),
        body: const Center(child: Text('')),
      );
    }

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                width: double.infinity,
                height: 170.0,
                decoration: BoxDecoration(
                  gradient: boxGradientRed(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/icon_pizza.png'),
                    const SizedBox(height: 8.0),
                    Image.asset('assets/images/check_custom_pizza.png'), // Check your custom pizza text
                  ],
                ),
              ),
              Positioned(
                top: 70.0,
                right: 0,
                child: Image.asset('assets/images/pizza_left_side.png')
              ),
              Positioned(
                top: 250,
                child: Container(
                  constraints: const BoxConstraints(minHeight: 346.0),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.shopping_cart, color: redTextColor, size: 17),
                      Text(
                        'Order Summary'.toUpperCase(),
                        style: textPreTitle(color: redTextColor).copyWith(height: 1.8)
                      ),
                      const SizedBox(height: 15.0),
                      const Divider(height: 0.5, color: Color(0xffDADAE5)),
                      const SizedBox(height: 20.0),
                      tableRow('${sizeLabels[providerCart.size]} Size',  prices[providerCart.size]!),
                      tableRow('${crustLabels[providerCart.crust]} Crust', crusts[providerCart.crust]!),
                      ListView.builder(
                        shrinkWrap: true, // https://karthikponnam.medium.com/flutter-unbounded-height-5e7b705dd863
                        itemCount: providerCart.toppings.length,
                        itemBuilder: (context, index) {
                          final key = providerCart.toppings[index];
                          return tableRow(ingredients[key]['name'], ingredients[key]['price']);
                        }
                      ),
                      const SizedBox(height: 20.0),
                      const Divider(height: 0.5, color: Color(0xffDADAE5)),
                      const SizedBox(height: 15.0),
                      tableRow('Total:', providerCart.total, priceStyle: textHeader3(color: const Color(0xff6D6E9C))),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
      floatingActionButton: ActionButton(
        label: 'Confirm Pizza',
        onPressed: () {
          Navigator.of(context).pushNamed('/checkout');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Padding tableRow(String col1, double price, {TextStyle? priceStyle}) {
    priceStyle ??= textPreTitle(color: const Color(0xff6D6E9C));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(col1, style: textBody()),
          Text('\$${price.toStringAsFixed(2)}', style: priceStyle),
        ],
      ),
    );
  }
}

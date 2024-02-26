import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/utils/box.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/button_action.dart';
import 'package:pizza_app/widgets/icon_edit.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
        child: Column(
          children: [
            SizedBox(
              height: 460.0,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(25.0),
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                      gradient: boxGradientRed(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/icon_cart.png'),
                        const SizedBox(height: 5.0),
                        Text('Checkout', style: textHeader1(color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0, right: 20.0, bottom: 0, left: 20.0),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0, right: 20.0, bottom: 0, left: 20.0),
                    child: Container(
                      // constraints: const BoxConstraints(minHeight: 100.0),
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.room, color: redTextColor),
                              const SizedBox(width: 5.0),
                              Expanded(
                                child: Text('Delivery Address', style: textHeader4(color: redTextColor))
                              ),
                              const IconEdit(),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Text('Home', style: textBodyBold()),
                          Text('3728  Brand Road, Swift Current', style: textBody()),
                          const SizedBox(height: 15.0),
                          const Divider(height: 0.5, color: Color(0xffDADAE5)),
                          const SizedBox(height: 25.0),
                          Text('+    Add delivery instruction', style: textBodyBold()),
                          const SizedBox(height: 25.0),
                          const Divider(height: 0.5, color: Color(0xffDADAE5)),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Contactless Delivery:\n',
                                  style: textBodyBold(),
                                  children: [
                                    TextSpan(text: 'Rider will place order at your door', style: textBody())
                                  ],
                                )
                              ),
                              Center( // Custom checkbox
                                child: InkWell(
                                  onTap: () {
                                    providerCart.contactless = !providerCart.contactless;
                                  },
                                  child: providerCart.contactless
                                    ? Image.asset('assets/images/toggle_btn_on.png', width: 50.0)
                                    : Image.asset('assets/images/toggle_btn_off.png', width: 50.0),
                                )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.wallet, color: redTextColor),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text('Payment method', style: textHeader4(color: redTextColor))
                        ),
                        const IconEdit(),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/visa_card.png'),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'VISA:\n',
                              style: textPreTitle(color: defaultTextColor),
                              children: [
                                TextSpan(text: '....0145', style: textBody())
                              ],
                            )
                          )
                        ),
                        Text(
                          '\$ ${providerCart.total.toStringAsFixed(2)}',
                          style: textBodyBold()
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffDEF3E1),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Text('10% Cashback Applied'.toUpperCase(), style: textPreTitle(color: const Color(0xff57C168))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ActionButton(
        label: 'Place Order',
        onPressed: () {
          Navigator.of(context).pushNamed('/order');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

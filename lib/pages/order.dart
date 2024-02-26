import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/app_bar.dart';
import 'package:pizza_app/utils/box.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:provider/provider.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
              height: 720.0,
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
                        Image.asset('assets/images/icon_receipt.png'),
                        const SizedBox(height: 5.0),
                        Text('Order Details', style: textHeader1(color: Colors.white)),
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
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ordered On'.toUpperCase(), style: textPreTitle(color: defaultTextColor)),
                                Text('Invoice #'.toUpperCase(), style: textPreTitle(color: defaultTextColor)),
                                Text('Total Due'.toUpperCase(), style: textPreTitle(color: defaultTextColor)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat('d MMM').format(DateTime.now()), style: textHeader4(color: redTextColor)),
                                Text('#15569', style: textHeader4(color: redTextColor)),
                                Text('\$${providerCart.total.toStringAsFixed(2)}', style: textHeader4(color: redTextColor)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          const Divider(height: 0.5, color: Color(0xffDADAE5)),
                          const SizedBox(height: 25.0),
                          statusTimeline(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Container(
                width: double.infinity,
                height: 81.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(222, 243, 225, 0.5),
                  border: Border.all(
                    color: const Color(0xff57C168),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80.0,
                      alignment: Alignment.center,
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 6),
                              blurRadius: 25,
                              spreadRadius: 0,
                              color: Color.fromRGBO(87, 193, 104, 0.3),
                            )
                          ],
                        ),
                        child: Image.asset('assets/images/icon_cashback.png')
                      )
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Earned cashback!\n',
                          style: textBodyBold(color: const Color(0xff57C168)),
                          children: [
                            TextSpan(
                              text: '+ \$1.45',
                              style: textBody(),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      width: 56.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(222, 243, 225, 0.5),
                        border: Border.all(
                          color: const Color(0xff57C168),
                          width: 0.5,
                        ),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)
                        )
                      ),
                      child: Image.asset('assets/images/right_arrow.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row statusTimeline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 420,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Stack(
              children: [
                Image.asset('assets/images/icon_confirmed.png'),
                redLine(top: 58, left: 44),
                progressIcon(icon: 'preparing', top: 88, left: 0),
                grayLine(top: 146, left: 44),
                progressIcon(icon: 'dispatched', top: 194, left: 25),
                grayLine(top: 234, left: 44),
                progressIcon(icon: 'transit', top: 282, left: 25),
                grayLine(top: 322, left: 44),
                progressIcon(icon: 'delivered', top: 370, left: 25),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              progressLabel('Order Confirmed', time: '11:41 AM:'),
              const SizedBox(height: 52),
              progressLabel('Preparing...', time: '12:01 PM:'),
              const SizedBox(height: 60),
              progressLabel('Dispatched'),
              const SizedBox(height: 66),
              progressLabel('In Transit'),
              const SizedBox(height: 66),
              progressLabel('Delivered'),
            ],
          ),
        )
      ],
    );
  }

  Padding redLine({ required double top, required double left }) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Image.asset('assets/images/line_red.png'),
    );
  }

  Padding grayLine({ required double top, required double left }) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Image.asset('assets/images/line_gray.png'),
    );
  }

  Padding progressIcon({ required String icon, required double top, required double left }) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Image.asset('assets/images/icon_$icon.png'),
    );
  }

  RichText progressLabel(String text, { String? time }) {
    if (time != null) {
      return RichText(
        text: TextSpan(
          text: '$time\n',
          style: textPreTitle(color: defaultTextColor),
          children: [
            TextSpan(
              text: text,
              style: textBody().copyWith(fontWeight: FontWeight.w500)
            )
          ],
        )
      );
    } else {
      return RichText(
        text: TextSpan(
          text: text,
          style: textBody()
        ),
      );
    }
  }
}

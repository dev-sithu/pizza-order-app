import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/providers/cart_provider.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/arc_downward.dart';
import 'package:provider/provider.dart';

class PizzaOptionStack extends StatelessWidget {
  const PizzaOptionStack({
    super.key,
    required this.type
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    final providerCart  = Provider.of<CartProvider>(context);

    final String size   = providerCart.size;
    final String crust  = providerCart.crust;
    final double price  = providerCart.price;
    Map<String, dynamic> meta = imageMeta[size];
    final String labelOnArc = type == 'size' ? '${sizes[size]}"' : '+\$${crusts[crust]!.toStringAsFixed(2)}';
    List<Widget> stackList = [];

    if (type != 'topping') {
      if (type == 'crust') {
        meta = imageMeta['md'];
      }

      // Semi-circle arc
      stackList.add(
        Positioned(
          left: (MediaQuery.of(context).size.width / 2) - meta['arc']['radius'],
          top: meta['arc']['top'],
          child: ArcDownward(diameter: meta['arc']['diameter']),
        )
      );
    }

    // Half BG / Hero section
    stackList.add(
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
                  '\$${price.toStringAsFixed(2)}',
                  style: textHeader2(color: Colors.white)
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              child: selectionInfo(context)
            )
          ],
        ),
      ),
    );

    // Pizza image
    stackList.add(
      Positioned(
        left: (MediaQuery.of(context).size.width / 2) - meta['img']['radius'],
        top: meta['img']['top'],
        child: type == 'size'
          ? Image.asset('assets/images/pizza_$size.png')
          : Image.asset('assets/images/pizza_$crust.png'),
      ),
    );

    if (type != 'topping') {
      // Size label
      stackList.add(
        Positioned(
          left: (MediaQuery.of(context).size.width / 2) - meta['label']['radius'],
          bottom: meta['label']['bottom'],
          child: Container(
            padding: const EdgeInsets.only(top: 5, right: 13, bottom: 5, left: 13),
            decoration: const BoxDecoration(
              color: Color(0xffDADAE5),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Text(
              labelOnArc,
              style: textPreTitle(color: const Color(0xffA0A8CC)),
              textAlign: TextAlign.center
            ),
          ),
        )
      );
    }

    return SizedBox(
      height: type == 'topping' ? 460 : 500,
      child: Stack(
        children: stackList
      ),
    );
  }

  RichText selectionInfo(BuildContext context) {
    final providerCart = Provider.of<CartProvider>(context);

    List<TextSpan> selection = [];
    TextStyle whitePure = textPreTitle(color: Colors.white);
    TextStyle whitePale = textPreTitle(color: Colors.white.withOpacity(0.3));

    if (providerCart.size.isNotEmpty) {
      selection.add(TextSpan(text: '${sizeLabels[providerCart.size]!.toUpperCase()}, ', style: whitePure));
    } else {
      selection.add(TextSpan(text: 'size, '.toUpperCase(), style: whitePale));
    }

    if (providerCart.crust.isNotEmpty) {
      selection.add(TextSpan(text: '${'${crustLabels[providerCart.crust]} crust'.toUpperCase()}, ', style: whitePure));
    } else {
      selection.add(TextSpan(text: 'crust, '.toUpperCase(), style: whitePale));
    }

    if (providerCart.toppings.isNotEmpty) {
      int i = 0;
      for (var key in providerCart.toppings) {
        selection.add(
          TextSpan(
            text: ingredients[key]['name'].toUpperCase() + (i < providerCart.toppings.length - 1 ? ', ' : ''),
            style: whitePure
          )
        );
        i++;
      }
    } else {
      selection.add(TextSpan(text: 'toppings'.toUpperCase(), style: whitePale));
    }

    return RichText(text: TextSpan(children: selection));
  }
}

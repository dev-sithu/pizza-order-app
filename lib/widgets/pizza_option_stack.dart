import 'package:flutter/material.dart';
import 'package:pizza_app/config/constants.dart';
import 'package:pizza_app/utils/typography.dart';
import 'package:pizza_app/widgets/arc_downward.dart';

class PizzaOptionStack extends StatelessWidget {
  const PizzaOptionStack({
    super.key,
    required this.type,
    required this.size,
    required this.crust,
    required this.prize,
  });

  final String type;
  final String size;
  final String crust;
  final double prize;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> meta = imageMeta[size];
    final String labelOnArc = type == 'size' ? '${sizes[size]}"' : '+\$${crusts[crust]!.toStringAsFixed(2)}';

    return SizedBox(
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
                      '\$${prize.toStringAsFixed(2)}',
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
            child: type == 'size'
              ? Image.asset('assets/images/pizza_$size.png')
              : Image.asset('assets/images/pizza_$crust.png'),
          ),
          // Size label
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
        ],
      ),
    );
  }
}

import 'package:cup_of_coffee/src/white_cup_body.dart';
import 'package:cup_of_coffee/src/white_cup_handle.dart';
import 'package:cup_of_coffee/src/white_cup_top.dart';
import 'package:flutter/cupertino.dart';

import 'coffee_in_cup.dart';

class WhiteCupWithCoffee extends StatelessWidget {
  final double cupWidth;
  final double cupTopHeight;

  const WhiteCupWithCoffee(
      {super.key, required this.cupWidth, required this.cupTopHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: (cupWidth + cupTopHeight / 2) / 4,
          left: cupWidth - cupWidth / 4,
          child: WhiteCupHandle(width: cupWidth / 2, height: cupWidth),
        ),
        WhiteCupBody(width: cupWidth, topHeight: cupTopHeight / 2),
        WhiteCupTop(width: cupWidth, cupTopHeight: cupTopHeight),
        CoffeeInCup(cupWidth: cupWidth, cupTopHeight: cupTopHeight),
      ],
    );
  }
}

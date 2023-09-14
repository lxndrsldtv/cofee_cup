import 'package:flutter/material.dart';

import './fluid_surface_clipper.dart';

class CoffeeInCup extends StatelessWidget {
  final double cupWidth;
  final double cupTopHeight;

  const CoffeeInCup(
      {super.key, required this.cupWidth, required this.cupTopHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 10,
      child: ClipPath(
        clipper: FluidSurfaceClipper(Size(cupWidth - 20, 40)),
        child: Container(
          width: cupWidth - 20,
          height: cupTopHeight - 10,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.brown, Colors.black26])),
        ),
      ),
    );
  }
}

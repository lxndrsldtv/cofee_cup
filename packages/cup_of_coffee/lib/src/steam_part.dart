import 'dart:ui';

import 'package:flutter/material.dart';

class SteamPart extends StatelessWidget {
  final double width;
  final double height;

  const SteamPart({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return   ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 32),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: RadialGradient(colors: [Colors.white, Color(0x00ffffff)]),
          ),
        ),
      );
  }
}

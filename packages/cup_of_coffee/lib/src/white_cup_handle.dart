import 'package:flutter/material.dart';

class WhiteCupHandle extends StatelessWidget {
  final double width;
  final double height;

  const WhiteCupHandle({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * 1.2,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffbcbcbc), width: width / 5),
        borderRadius:
            const BorderRadius.horizontal(right: Radius.circular(50.0)),
      ),
    );
  }
}

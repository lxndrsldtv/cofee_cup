import 'package:flutter/material.dart';

class WhiteCupTop extends StatelessWidget {
  final double width;
  final double cupTopHeight;

  const WhiteCupTop(
      {super.key, required this.width, required this.cupTopHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Container(
            width: width,
            height: cupTopHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.white, Color(0xffd7d7d7)]),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 10,
          child: ClipOval(
            child: Container(
              width: width - 20, //??? probably depends on width
              height: cupTopHeight - 10, //??? probably depends on height
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Color(0xffd9d9d9), Color(0xffc8c8c8)])),
            ),
          ),
        ),
      ],
    );
  }
}

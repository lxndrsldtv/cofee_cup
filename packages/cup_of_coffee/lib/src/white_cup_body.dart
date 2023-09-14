import 'package:flutter/material.dart';

class WhiteCupBody extends StatelessWidget {
  final double width;
  final double topHeight;

  const WhiteCupBody({super.key, required this.width, required this.topHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width + width / 4,
      height: width + topHeight,
      child: Row(
        children: [
          Column(
            children: [
              // place for top of cup
              SizedBox(width: width, height: topHeight),
              Container(
                width: width,
                height: width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(60.0)),
                    gradient: LinearGradient(
                        colors: [Colors.white, Color(0xffa6a6a6)])),
              ),
            ],
          ),
          // place for cup handle
          SizedBox(width: width / 4, height: width + topHeight),
        ],
      ),
    );
  }
}

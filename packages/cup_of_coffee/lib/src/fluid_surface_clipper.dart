import 'package:flutter/cupertino.dart';

class FluidSurfaceClipper extends CustomClipper<Path> {
  final Size size;

  FluidSurfaceClipper(this.size);

  @override
  Path getClip(Size size) {
    final surfacePathPart1 = Path()
      ..addOval(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    final surfacePathPart2 = Path()
      ..addOval(Rect.fromLTWH(0.0, 25.0, size.width, size.height));
    return Path.combine(
        PathOperation.intersect, surfacePathPart1, surfacePathPart2);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

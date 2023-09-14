import 'dart:developer' as dev;
import 'dart:math';
import 'dart:ui';

import 'package:cup_of_coffee/src/steam_part.dart';
import 'package:cup_of_coffee/src/white_cup_with_coffee.dart';
import 'package:flutter/material.dart';

class Steam extends StatefulWidget {
  const Steam({super.key});

  @override
  State<Steam> createState() => _SteamState();
}

class _SteamState extends State<Steam> with TickerProviderStateMixin {
  late final AnimationController _animationController1;
  late final AnimationController _animationController2;
  late final AnimationController _animationController3;
  late final AnimationController _animationController4;
  late final AnimationController _animationController5;
  late final AnimationController _animationController6;
  final _animationControllers = List<AnimationController>.empty(growable: true);

  @override
  void initState() {
    _animationController1 =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..stop();
    _animationController2 =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..stop();
    _animationController3 =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..stop();
    _animationController4 =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..stop();
    _animationController5 =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..stop();
    _animationController6 =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..stop();

    _animationControllers.add(_animationController1);
    _animationControllers.add(_animationController2);
    _animationControllers.add(_animationController3);
    _animationControllers.add(_animationController4);
    _animationControllers.add(_animationController5);
    _animationControllers.add(_animationController6);

    Future.delayed(const Duration(milliseconds: 1000), () {
      dev.log('a1 start');
      _animationController1.repeat();
    });
    Future.delayed(const Duration(milliseconds: 2000), () {
      dev.log('a2 start');
      _animationController2.repeat();
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      dev.log('a3 start');
      _animationController3.repeat();
    });
    Future.delayed(const Duration(milliseconds: 4000), () {
      dev.log('a4 start');
      _animationController4.repeat();
    });
    Future.delayed(const Duration(milliseconds: 5000), () {
      dev.log('a5 start');
      _animationController5.repeat();
    });
    Future.delayed(const Duration(milliseconds: 6000), () {
      dev.log('a6 start');
      _animationController6.repeat();
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final container = constraints.biggest;
        final cupBodyWidth = container.width / 2;
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blueGrey,
            ),
            Positioned(
              left: container.width / 4,
              bottom: 8.0,
              child: WhiteCupWithCoffee(
                cupWidth: cupBodyWidth,
                cupTopHeight: 50,
              ),
            ),
            ...createFlyingUpSteamCloudSet(container: container),
          ],
        );
      },
    );
  }

  List<Widget> createFlyingUpSteamCloudSet({
    required Size container,
  }) {
    final clouds = List<Widget>.empty(growable: true);

    for (int i = 0; i < 6; i++) {
      // final parts = (i + 1) ~/ 2 == 0 ? 3 : (i + 1) ~/ 2;
      final parts = Random().nextInt(6);
      dev.log('========== parts: $parts');
      clouds.add(createFlyingUpSteamCloud(
          topBegin: container.height - 350,
          topEnd: -200,
          //-container.height,
          container: container,
          parent: _animationControllers[i],
          child: createAnimatedSteamCloud(
              parts: parts, //(i + 1) ~/ 2, //
              container: container,
              parent: _animationControllers[i])));
    }
    return clouds;
  }

  Widget createFlyingUpSteamCloud({
    required double topBegin,
    required double topEnd,
    required Size container,
    required Widget child,
    required Animation<double> parent,
  }) {
    return PositionedTransition(
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
            Rect.fromLTWH(0.0, topBegin, container.width, container.height / 2),
            container),
        end: RelativeRect.fromSize(
            Rect.fromLTWH(0.0, topEnd, container.width, container.height / 2),
            container),
      ).animate(
        CurvedAnimation(
            parent: parent,
            curve: const Interval(0.0, 1.0, curve: Curves.linear)),
      ),
      child: child,
    );
  }

  Widget createAnimatedSteamCloud({
    required int parts,
    required Size container,
    required Animation<double> parent,
  }) {
    return SizedBox(
      width: container.width,
      height: container.height / 2, //300,
      child: LayoutBuilder(builder: (context, constraints) {
        final subContainer = constraints.biggest;
        return ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 8),
          child: Stack(
            children: [
              parts == 0 || parts == 3 || parts == 5 || parts == 6
                  ? doLeftPositionedTransition(
                      leftBegin: subContainer.width / 4,
                      leftEnd: subContainer.width / 10,
                      container: subContainer,
                      parent: parent,
                      child: doFadeInThenOut(
                        parent: parent,
                        child: const SteamPart(width: 8, height: 102),
                      ),
                    )
                  : const SizedBox(),
              parts == 1 || parts == 3 || parts == 4 || parts == 6
                  ? Positioned(
                      left: 0,
                      top: 0,
                      child: doFadeInThenOut(
                        parent: parent,
                        child: const SteamPart(width: 8, height: 102),
                      ),
                    )
                  : const SizedBox(),
              parts == 2 || parts == 4 || parts == 5 || parts == 6
                  ? doLeftPositionedTransition(
                      leftBegin: subContainer.width / 4,
                      leftEnd: subContainer.width / 3,
                      container: subContainer,
                      parent: parent,
                      child: doFadeInThenOut(
                        parent: parent,
                        child: const SteamPart(width: 8, height: 102),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      }),
    );
  }

  Widget doLeftPositionedTransition({
    required double leftBegin,
    required double leftEnd,
    // required double childWidth,
    required Size container,
    required Widget child,
    required Animation<double> parent,
  }) {
    return PositionedTransition(
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
            Rect.fromLTWH(
                leftBegin, 0.0, container.width / 2, container.height),
            container),
        end: RelativeRect.fromSize(
            Rect.fromLTWH(leftEnd, 0.0, container.width / 2, container.height),
            container),
      ).animate(
        CurvedAnimation(
            // parent: _animationController1,
            parent: parent,
            curve: const Interval(0.0, 1.0, curve: Curves.linear)),
      ),
      child: child,
    );
  }

  Widget doFadeInThenOut({
    required Widget child,
    required Animation<double> parent,
  }) {
    return doFadeOut(
      child: doFadeIn(child: child, parent: parent),
      parent: parent,
    );
  }

  Widget doFadeOut({
    required Widget child,
    required Animation<double> parent,
  }) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(CurvedAnimation(
          parent: parent,
          curve: const Interval(0.2, 1.0, curve: Curves.linear))),
      child: child,
    );
  }

  Widget doFadeIn({
    required Widget child,
    required Animation<double> parent,
  }) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
          parent: parent,
          curve: const Interval(0.0, 0.2, curve: Curves.linear))),
      child: child,
    );
  }
}

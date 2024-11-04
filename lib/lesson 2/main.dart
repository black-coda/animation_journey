import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const AppWidget());

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;

        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleClipper({required this.side});
  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with TickerProviderStateMixin {
  late AnimationController _clockwiseAnimationController;
  late Animation _clockwiseAnimation;
  @override
  void initState() {
    super.initState();
    _clockwiseAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _clockwiseAnimation = Tween<double>(begin: 0, end: -(pi / 2)).animate(
      _clockwiseAnimationController,
    );
  }

  @override
  void dispose() {
    _clockwiseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipPath(
                clipper: HalfCircleClipper(side: CircleSide.left),
                child: Container(
                  color: Colors.amber,
                  height: 200,
                  width: 200,
                ),
              ),
              ClipPath(
                clipper: HalfCircleClipper(side: CircleSide.right),
                child: Container(
                  color: Colors.green,
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

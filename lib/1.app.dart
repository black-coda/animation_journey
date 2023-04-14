import 'package:flutter/material.dart';

class Animate1 extends StatefulWidget {
  const Animate1({super.key});

  @override
  State<Animate1> createState() => _Animate1State();
}

class _Animate1State extends State<Animate1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    final animatedC =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _animation = Tween<double>(begin: 0, end: 1).animate(animatedC);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animate 1'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()..rotateX(_animation.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            );
          },
        ),
      ),
    );
  }
}

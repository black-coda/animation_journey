import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween<double>(begin: 0, end: 360).animate(_controller);
    //* or
    //* animation = Tween<double>(begin: 0, end: 360).animate(_controller)..addListener(() {setState(() {

    //* });});
    //! The addListener() function calls setState(), so every time the Animation generates a new number,
    //! the current frame is marked dirty, which forces build() to be called again. In build(), the container changes size because its height and width now use animation.value instead of a hardcoded value.
    //! Dispose of the controller when the State object is discarded to prevent memory leaks.
    animation.addListener(() {
      setState(() {});
    });

    debugPrint(animation.value.toString());
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

   @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContainerExpandedAnimate extends StatefulWidget {
  const ContainerExpandedAnimate({super.key});

  @override
  State<ContainerExpandedAnimate> createState() =>
      _ContainerExpandedAnimateState();
}

class _ContainerExpandedAnimateState extends State<ContainerExpandedAnimate>
    with SingleTickerProviderStateMixin {
  double height = 50;
  double width = 50;

  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animation = Tween<double>(begin: 100, end: 200).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          height = 100;
          width = 100;
        }),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(
                seconds: 30,
              ),
              color: Colors.teal[700],
              height: height,
              width: width,
            ),
          ),
          const SizedBox(
            height: 400,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_home,
            progress: _animation,
            size: height,
          )
        ],
      ),
    );
  }
}

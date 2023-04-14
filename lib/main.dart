// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:animation_journey/1.app.dart';
import 'package:animation_journey/Docs/fluc_doc.dart';
import 'package:animation_journey/Docs/imp2.dart';
import 'package:animation_journey/Docs/implicit_foo.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

Color getRandomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "App Entry",
                style: TextStyle(letterSpacing: 5),
              ),
            ),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomBtn(
                    text: "Project 1",
                    pressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Animate1(),
                      ),
                    ),
                  ),
                  CustomBtn(
                    text: "Implicit",
                    pressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContainerExpandedAnimate(),
                      ),
                    ),
                  ),
                  CustomBtn(
                    text: "Implicit Rocket Launcher",
                    pressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AnimateRocket(),
                      ),
                    ),
                  ),
                  CustomBtn(
                    text: "Flutter Docs",
                    pressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LogoApp(),
                      ),
                    ),
                  ),
                  CustomBtn(
                    text: "Flutter Docs",
                    pressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LogoApp2(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.text,
    required this.pressed,
  }) : super(key: key);
  final String text;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: null,
      child: GestureDetector(
        onTap: pressed,
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.send_rounded,
              color: getRandomColor(),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(color: getRandomColor(), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

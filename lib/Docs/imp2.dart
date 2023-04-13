import 'package:flutter/material.dart';

class AnimateRocket extends StatefulWidget {
  const AnimateRocket({super.key});

  @override
  State<AnimateRocket> createState() => _AnimateRocketState();
}

class _AnimateRocketState extends State<AnimateRocket> {
  var btmMargin = 10.0;

  void fire() {
    setState(() {
      if (btmMargin == 900.0) {
        btmMargin = 10;
      } else {
        btmMargin = 900;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: const BoxConstraints.expand(),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg",
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedContainer(
              margin: EdgeInsets.only(bottom: btmMargin),
              height: 150,
              width: 100,
              duration: const Duration(seconds: 2),
              child: Image.asset("assets/rocket.png"),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: fire, child: const Text("Fire Up ")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

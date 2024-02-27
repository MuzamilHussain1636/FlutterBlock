import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/animation/money-bag.gif",
          height: 35,
        ),
      ),
    );
  }
}

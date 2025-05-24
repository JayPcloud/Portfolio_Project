import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controllers/body_controller.dart';

class CircularOrbitingText extends StatefulWidget {
  const CircularOrbitingText({super.key});

  @override
  State<CircularOrbitingText> createState() => _CircularOrbitingTextState();
}

class _CircularOrbitingTextState extends State<CircularOrbitingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> words = BodyController.instance.personalInfo.topSkills??["Flutter", "Firebase", "UI/UX", "Dart", "Python","Figma", "Django"];
  final double radius = 80.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _calculatePosition(double angle, double radius) {
    final dx = radius * cos(angle);
    final dy = radius * sin(angle);
    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final angle = _controller.value * 2 * pi;
          return Stack(
            alignment: Alignment.center,
            children: [
              // Central Icon
               Icon(FontAwesomeIcons.screwdriverWrench, color: context.theme.colorScheme.onPrimary),
              // Orbiting words
              for (int i = 0; i < words.length; i++)
                Transform.translate(
                  offset: _calculatePosition(
                      angle + (2 * pi / words.length) * i, radius),
                  child: Text(
                    words[i],
                    style: context.textTheme.bodyMedium!.copyWith(fontSize: 11),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}

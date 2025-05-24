import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      required this.borderRadius,
      this.height,
      this.width,
      this.color,
      this.gradient,
      this.child, this.border, this.padding, this.constraints
      });

  final double borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final Color? color;
  final Border? border;
  final Gradient? gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(borderRadius),
        color: color,
        border: border,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

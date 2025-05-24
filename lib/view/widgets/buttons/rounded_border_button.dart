import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/constants/sizes.dart';

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton({
    super.key,
    required this.child,
    this.hasBorder = true,
    this.height,
    this.borderRadius = Sizes.mdBorderRd,
    this.borderWidth = Sizes.smBorderWidth,
    this.color,
    this.borderColor,
    this.onPressed,
    this.hoverColor,
    this.elevation,
    this.splashColor,
  });

  final Widget child;
  final double borderRadius, borderWidth;
  final double? height, elevation;
  final Color? color,borderColor, hoverColor, splashColor;
  final bool hasBorder;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: 0,
      color: color,
        elevation: elevation,
        hoverColor: hoverColor,
        splashColor: splashColor,
        shape: RoundedRectangleBorder(
            side: hasBorder
                ? BorderSide(
                    color: borderColor ?? context.theme.colorScheme.outline,
                    width: borderWidth)
                : BorderSide.none,
            borderRadius: BorderRadiusDirectional.circular(borderRadius)),
        onPressed: onPressed??(){},
        child: child);
  }
}

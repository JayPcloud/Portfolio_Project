import'package:flutter/material.dart';
import 'package:portfolio/common/constants/sizes.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, required this.mobileView, required this.desktopView});

  final Widget desktopView;

  final Widget mobileView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
       if (constraints.maxWidth < Sizes.desktopMinWidth) {
          return mobileView;
        } else {
          return desktopView;
        }
      },
    );
  }
}

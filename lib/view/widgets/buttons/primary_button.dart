import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/view/widgets/animations/contentSwipe_animation_wrapper.dart';

import '../../../common/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, this.text = '', this.icon, this.borderRadius = Sizes.lgBorderRd, this.width, this.style, this.onTap, this.trailWidget});

  final IconData? icon;
  final String? text;
  final Widget? trailWidget;
  final double? borderRadius;
  final double? width;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap??() {  },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 7,horizontal: Sizes.smPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(borderRadius! ),
          gradient: LinearGradient(
            colors: [
              context.theme.primaryColor,
              if(context.isDarkMode)Color(0xfff398ba)
              else context.theme.primaryColorLight,
              context.theme.primaryColorLight,

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: icon != null
            ? OnHoverSwipeAnimation(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: Sizes.smallSpace,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text!,
                      style: GoogleFonts.montserrat(textStyle: style??context.textTheme.labelLarge),
                    ),
                    if(trailWidget==null)Icon(
                      icon,
                      color: context.textTheme.labelLarge!.color,
                      size: context.textTheme.labelLarge!.fontSize,
                    )
                    else trailWidget!
                  ],
                ),
            )
            : OnHoverSwipeAnimation(
              child: Center(
                child: Text(
                    text!,
                    style: GoogleFonts.montserrat(textStyle: style??context.textTheme.labelLarge),
                  ),
              ),
            ),
      ),
    );
  }
}

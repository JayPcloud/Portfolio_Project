import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/utils_func.dart';
import 'package:portfolio/view/widgets/animations/circular_orbiting_text.dart';
import 'package:portfolio/view/widgets/animations/contentSwipe_animation_wrapper.dart';
import 'package:portfolio/view/widgets/animations/scroll_entrance_animation.dart';
import 'package:portfolio/view/widgets/buttons/rounded_border_button.dart';

import '../../../common/constants/sizes.dart';
import '../../../common/constants/texts.dart';
import '../../../controllers/body_controller.dart';
import '../../../controllers/layout_controller.dart';

class DesktopHomeMenu extends StatelessWidget {
  const DesktopHomeMenu({super.key, required this.constraints,});

  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    final layoutController = LayoutController.instance;
    final bodyController = BodyController.instance;
    return ScrollEntrance(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight,),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Sizes.spaceBtwSectionsD,),
                  RoundedBorderButton(
                   // color: context.theme.colorScheme.surface,
                      hasBorder: false,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: Sizes.smallSpace,
                        children: [
                          Icon(Icons.connect_without_contact, size: context.textTheme.labelMedium!.fontSize,),
                          Text("Let's connect", style: context.textTheme.labelMedium,),
                        ],),
                    onPressed: ()=> LayoutController.scrollToMenu(layoutController.socialContactWidgetKey),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: FittedBox(
                      child: Text("I'm ${bodyController.personalInfo.firstname??Texts.firstname} ${bodyController.personalInfo.lastname??Texts.lastname}\n"
                          "${bodyController.personalInfo.role??Texts.role} \nand UI/UX Designer",
                        style: GoogleFonts.tomorrow(textStyle: context.textTheme.displayLarge!.copyWith(height: 1.25,)),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizes.defaultSpaceD,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RoundedBorderButton(
                          borderWidth: 0.15,
                          hasBorder: true,
                          color: context.theme.colorScheme.surface,
                          onPressed: ()=> LayoutController.scrollToMenu(layoutController.menuKeys[1]),
                          child: OnHoverSwipeAnimation(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: Sizes.spaceBtwItems,
                              children: [
                                Text("My works", style: context.textTheme.labelMedium,),
                                Icon(Icons.work, size: context.textTheme.labelMedium!.fontSize),
                              ],),
                          )),
                      SizedBox(width: Sizes.spaceBtwItems,),
                      OnHoverSwipeAnimation(
                        child: RoundedBorderButton(
                            hasBorder: false,
                            onPressed: ()=>BodyController.pLaunchUrl(
                              bodyController.workRelatedInfo.cv??Texts.cvDownloadUrl,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: Sizes.smallSpace,
                              children: [
                                Text("Download CV", style: context.textTheme.labelSmall,),
                                Icon(FontAwesomeIcons.download, size: context.textTheme.labelSmall!.fontSize, color: context.textTheme.labelSmall!.color,),
                              ],)),
                      ),
                    ],),
                  SizedBox(height: Sizes.spaceBtwSectionsD,),
      
                ],
              ),
              Transform.scale(
                scale: UtilsFunc.deviceWidth(context)>1200?1:0.8,
                child: SizedBox(
                  height:  UtilsFunc.deviceWidth(context)>1200?200:150,
                  width: UtilsFunc.deviceWidth(context)>1200?200:150,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircularOrbitingText()
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

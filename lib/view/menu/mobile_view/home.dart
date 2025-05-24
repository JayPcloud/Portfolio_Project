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
import '../../widgets/layout/components/desktop_sideBar.dart';

class MobileHomeMenu extends StatelessWidget {
  const MobileHomeMenu({super.key, required this.constraints,});

  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    final layoutController = LayoutController.instance;
    final bodyController = BodyController.instance;
    return ScrollEntrance(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight,),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: constraints.maxWidth * 0.8,
                  child: FittedBox(
                    child: Text("I'm ${bodyController.personalInfo.firstname??Texts.firstname} ${bodyController.personalInfo.lastname??Texts.lastname}\n"
                        "${bodyController.personalInfo.role??Texts.role} \nand UI/UX Designer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tomorrow(textStyle: context.textTheme.displayLarge!.copyWith(height: 1.25,)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.defaultSpaceM,),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: Sizes.desktopSideBarMinWidth),
                child: SizedBox(
                  width: UtilsFunc.deviceWidth(context) * 0.17,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      spacing: Sizes.spaceBtwItems,
                      children: [
                        socialIconButton(
                            context,
                            icon: Icons.email_outlined,
                            onPressed: ()=>BodyController.launchEmail(bodyController.contacts.email??Texts.email)
                        ),
                        socialIconButton(
                            context,
                            icon: FontAwesomeIcons.whatsapp,
                            onPressed: ()=>BodyController.pLaunchUrl(bodyController.contacts.whatsappContactUrl??Texts.whatsappContactUrl)
                        ),
                        socialIconButton(
                            context,
                            icon: FontAwesomeIcons.github,
                            onPressed: ()=>BodyController.pLaunchUrl(bodyController.contacts.githubProfileUrl??Texts.githubProfileUrl)
                        ),
                        socialIconButton(
                            context,
                            iconSize: 15,
                            icon: FontAwesomeIcons.xTwitter,
                            onPressed: ()=>BodyController.pLaunchUrl(bodyController.contacts.xProfileUrl??Texts.xProfileUrl)
                        ),
                        socialIconButton(
                            context,
                            icon: FontAwesomeIcons.telegram,
                            onPressed: ()=>BodyController.pLaunchUrl(bodyController.contacts.telegramContactUrl??Texts.telegramContactUrl)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.defaultSpaceM,),
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
        ),
      ),
    );
  }
}

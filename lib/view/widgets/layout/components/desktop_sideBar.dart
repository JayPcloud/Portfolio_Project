import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/constants/sizes.dart';
import 'package:portfolio/controllers/body_controller.dart';
import 'package:portfolio/controllers/layout_controller.dart';
import 'package:portfolio/utils/utils_func.dart';
import 'package:portfolio/view/widgets/%20container/rounded_container.dart';
import 'package:portfolio/view/widgets/animations/contentSwipe_animation_wrapper.dart';
import 'package:portfolio/view/widgets/buttons/primary_button.dart';
import '../../../../common/constants/texts.dart';
import '../../animations/scroll_entrance_animation.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutController = LayoutController.instance;
    final bodyController = BodyController.instance;
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight,),
              child: IntrinsicHeight(
                child: Container(
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.defaultSpaceD),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: Sizes.spaceBtwItems,
                          children: [
                            RoundedContainer(
                              height: 35,
                              width: 35,
                              borderRadius: Sizes.mdBorderRd,
                              border: Border.all(
                                  color: context.theme.colorScheme.outline,
                                  width: Sizes.mdBorderWidth),
                              child: Icon(FontAwesomeIcons.code,
                                  size: Sizes.defIconSize),
                            ),
                            Text("${bodyController.personalInfo.firstname??Texts.firstname}\n"
                                "${bodyController.personalInfo.lastname??Texts.lastname}",
                                style: GoogleFonts.merriweather(
                                    textStyle: context.textTheme.displaySmall)),
                          ],
                        ),
                        SizedBox(
                          height: Sizes.spaceBtwItems,
                        ),
                        RoundedContainer(
                       constraints: BoxConstraints(minWidth: Sizes.desktopSideBarMinWidth, minHeight: Sizes.desktopSideBarMinWidth),
                          height: UtilsFunc.deviceWidth(context) * 0.17,
                          width: UtilsFunc.deviceWidth(context) * 0.17,
                          borderRadius: Sizes.mdBorderRd,
                          gradient: LinearGradient(colors: [
                            context.theme.primaryColor,
                            context.theme.primaryColorLight,
                          ]),
                        ),
                        SizedBox(height: UtilsFunc.deviceHeight(context) * 0.03),

                        Text(
                          'Specialization',
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          bodyController.personalInfo.specialization??'MobileApp Development',
                          style: context.textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: UtilsFunc.deviceHeight(context) * 0.04,
                        ),
                        Text(
                          'Address',
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          bodyController.personalInfo.location??'Anambra, Nigeria',
                          style: context.textTheme.titleLarge,
                        ),
                        Spacer(),

                        SizedBox(height: Sizes.spaceBtwItems,),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ConstrainedBox(
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
                        ),
                        SizedBox(
                          height: Sizes.spaceBtwItems,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: Sizes.desktopSideBarMinWidth),
                          child: PrimaryButton(
                            text: "Let's Work Together",
                            width: UtilsFunc.deviceWidth(context) * 0.17,
                            onTap: ()=> LayoutController.scrollToMenu(layoutController.socialContactWidgetKey)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
Widget socialIconButton(BuildContext context, {required IconData icon, double iconSize = Sizes.defIconSize, required void Function()? onPressed}) {
  return MaterialButton(
    padding: EdgeInsets.all(Sizes.defPadding),
    minWidth: 0,
    hoverColor: context.theme.primaryColorDark,
    onPressed: onPressed,
    color: context.theme.primaryColorDark,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(Sizes.mdBorderRd),
        side: context.isDarkMode?BorderSide.none:BorderSide(color: context.theme.colorScheme.outline, width: 0.05)
    ),
    child: OnHoverSwipeAnimation(
      child: Icon(
        icon,
        size: iconSize,
      ),
    ),
  );
}

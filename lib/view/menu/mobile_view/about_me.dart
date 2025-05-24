import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/body_controller.dart';
import 'package:portfolio/view/widgets/%20container/rounded_container.dart';
import 'package:portfolio/view/widgets/animations/scroll_entrance_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../common/constants/sizes.dart';
import '../../../common/constants/texts.dart';
import '../../widgets/buttons/primary_button.dart';

class MobileAboutMenu extends StatelessWidget {
  const MobileAboutMenu({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final bodyController = BodyController.instance;

    return Padding(
      padding: const EdgeInsets.only(right: Sizes.defaultSpaceM, top: Sizes.spaceBtwSectionsM * 2),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: Sizes.spaceBtwItems,
                children: [
                  Icon(
                    FontAwesomeIcons.info,
                    size: context.textTheme.labelMedium!.fontSize,
                  ),
                  Text(
                    "About Me",
                    style: context.textTheme.labelMedium,
                  )
                ],
              ),
              SizedBox(
                height: Sizes.spacingD,
              ),
              Text(
                "Turning ideas into reality through clean, efficient code",
                style: GoogleFonts.montserrat(
                    textStyle:
                    context.textTheme.displayLarge),
              ),
              SizedBox(
                height: Sizes.spaceBtwSectionsM,
              ),

              if(constraints.maxWidth < 550)ScrollEntrance(
                child: Column(
                  spacing: Sizes.defaultSpaceM,
                  children: [
                    milestoneWidget(context, 'Years of experience', bodyController.workRelatedInfo.workExperience??'2+', width: constraints.maxWidth * 0.4),
                    Row(
                      spacing: Sizes.defaultSpaceM,
                      children: [
                        Expanded(child: milestoneWidget(context, 'Projects done', bodyController.workRelatedInfo.projectsDone??'10+')),
                        Expanded(child: milestoneWidget(context, 'Repositories', bodyController.workRelatedInfo.repositories??'10+',)),

                      ],
                    ),
                  ],
                ),
              )else  ScrollEntrance(
                child: Row(
                  spacing: Sizes.defaultSpaceM,
                  children: [
                    Expanded(child: milestoneWidget(context, 'Projects done', bodyController.workRelatedInfo.projectsDone??'10+')),
                    Expanded(child: milestoneWidget(context, 'Repositories', bodyController.workRelatedInfo.repositories??'10+',)),
                    Expanded(child: milestoneWidget(context, 'Years of experience', bodyController.workRelatedInfo.workExperience??'2+',)),
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.defaultSpaceM,
              ),
              ScrollEntrance(
                  child:  Text(
                    bodyController.personalInfo.aboutMe??' ' * 50,
                    style: context.textTheme.bodyLarge,
                  ),
              ),
              ScrollEntrance(
                child: Row(
                  spacing: Sizes.defaultSpaceM,
                  children: [
                    Flexible(
                      child: Column(
                        spacing: Sizes.spaceBtwItems,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        Text('Name', style: context.textTheme.titleSmall, ),
                        SelectableText(
                          '${bodyController.personalInfo.firstname??Texts.firstname} '
                              '${bodyController.personalInfo.lastname??Texts.lastname}', style: context.textTheme.titleMedium,
                        ),
                      ],),
                    ),
                    Spacer(),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: Sizes.spaceBtwItems,
                        children: [
                          Text('Phone', style: context.textTheme.titleSmall),
                          SelectableText(bodyController.contacts.phone??Texts.phone, style: context.textTheme.titleMedium),
                        ],),
                    ),
                    Spacer(),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: Sizes.spaceBtwItems,
                        children: [
                          Text('Email', style: context.textTheme.titleSmall),
                          SelectableText(bodyController.contacts.email??Texts.email, style: context.textTheme.titleMedium,),
                        ],),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: Sizes.defaultSpaceM,
              ),
              ScrollEntrance(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: PrimaryButton(
                      text: "Download CV",
                      icon: FontAwesomeIcons.download,
                      style: context.textTheme.labelLarge!.copyWith(fontSize: 13),
                      onTap: ()=>BodyController.pLaunchUrl(
                        bodyController.workRelatedInfo.cv??Texts.cvDownloadUrl,
                      ),
                    )),
              ),

            ]),
      ),
    );
  }

  Widget milestoneWidget(BuildContext context, String title, String value, {double? width}) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: Sizes.defaultHeightD),
      child: Material(
        borderRadius: BorderRadiusDirectional.circular(Sizes.mdBorderRd),
        child: RoundedContainer(
          borderRadius: Sizes.mdBorderRd,
          height: constraints.maxHeight * 0.2,
          width: width,
          color: context.theme.colorScheme.surface,
          //border: Border.all(color: context.theme.colorScheme.outlineVariant, width: 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: GoogleFonts.montserrat(
                    textStyle:
                    context.textTheme.displayLarge!.copyWith(fontSize: 35)),
              ),
              Text(
                title,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

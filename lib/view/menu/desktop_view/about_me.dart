import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/body_controller.dart';
import 'package:portfolio/view/widgets/%20container/rounded_container.dart';
import 'package:portfolio/view/widgets/animations/scroll_entrance_animation.dart';
import '../../../common/constants/sizes.dart';
import '../../../common/constants/texts.dart';
import '../../widgets/buttons/primary_button.dart';

class DesktopAboutMenu extends StatelessWidget {
  const DesktopAboutMenu({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final bodyController = BodyController.instance;

    return Padding(
          padding: const EdgeInsets.only(right: Sizes.defaultSpaceD, top: Sizes.spaceBtwSectionsD * 2),
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
                        context.textTheme.displayLarge!.copyWith(fontSize: 35)),
              ),
              SizedBox(
                height: Sizes.defaultSpaceD,
              ),

              ScrollEntrance(
                child: Row(
                  spacing: Sizes.defaultSpaceD,
                  children: [
                    milestoneWidget(context, 'Projects done', bodyController.workRelatedInfo.projectsDone??'10+'),
                    milestoneWidget(context, 'Years of experience', bodyController.workRelatedInfo.workExperience??'2+'),
                    milestoneWidget(context, 'Repositories', bodyController.workRelatedInfo.repositories??'10+'),

                  ],
                ),
              ),
              SizedBox(
                height: Sizes.spaceBtwSectionsD,
              ),
              ScrollEntrance(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Text(
                          bodyController.personalInfo.aboutMe??' ' * 50,
                          style: context.textTheme.bodyLarge,
                        )),
                    SizedBox(width: Sizes.defaultSpaceD,),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name', style: context.textTheme.titleSmall),
                            SelectableText(
                              '${bodyController.personalInfo.firstname??Texts.firstname} '
                                  '${bodyController.personalInfo.lastname??Texts.lastname}', style: context.textTheme.titleMedium,
                            ),
                            SizedBox(height: Sizes.defaultSpaceD,),
                            Text('Phone', style: context.textTheme.titleSmall),
                            SelectableText(bodyController.contacts.phone??Texts.phone, style: context.textTheme.titleMedium),
                            SizedBox(height: Sizes.defaultSpaceD,),
                            Text('Email', style: context.textTheme.titleSmall),
                            SelectableText(bodyController.contacts.email??Texts.email, style: context.textTheme.titleMedium),
                            SizedBox(height: Sizes.defaultSpaceD,),
                            Text('Location', style: context.textTheme.titleSmall),
                            Text(bodyController.personalInfo.location??Texts.location, style: context.textTheme.titleMedium),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.spacingD,
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
    
               //    SizedBox(height: Sizes.spaceBtwSectionsD),
               //
               // Padding(
               //  padding: const EdgeInsets.only(right: Sizes.defaultSpaceD),
               //  child: GridView.builder(
               //    itemCount: 4,
               //    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: Sizes.defaultSpaceD,mainAxisSpacing: Sizes.defaultSpaceD,),
               //    physics: NeverScrollableScrollPhysics(),
               //    shrinkWrap: true,
               //    itemBuilder: (context, index) {
               //      return ConstrainedBox(
               //        constraints: BoxConstraints(minHeight: Sizes.mediumHeightD),
               //        child: Container(
               //          padding: EdgeInsets.all(Sizes.spacingD),
               //          height: constraints.maxHeight * 0.8,
               //          decoration: BoxDecoration(
               //            color: context.theme.colorScheme.onSurface,
               //          ),
               //          child: Column(
               //              mainAxisAlignment: MainAxisAlignment.start,
               //              crossAxisAlignment: CrossAxisAlignment.start,
               //              children:[
               //                Text("Frontend\ndevelopment", style: GoogleFonts.montserrat(textStyle: context.textTheme.displaySmall),),
               //                SizedBox(height: Sizes.spacingD,),
               //                Text("I work with Flutter and Dart", style: context.textTheme.bodyLarge,),
               //                SizedBox(height: Sizes.defaultSpaceD,),
               //                Expanded(child: SizedBox())
               //          ])
               //        ),
               //      );
               //    },
               //  ),)
    
            ]),
          ),
        );
  }

  Widget milestoneWidget(BuildContext context, String title, String value) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: Sizes.defaultHeightD),
        child: Material(
          borderRadius: BorderRadiusDirectional.circular(Sizes.mdBorderRd),
          child: RoundedContainer(
            borderRadius: Sizes.mdBorderRd,
            height: constraints.maxHeight * 0.2,
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
      ),
    );
  }
}

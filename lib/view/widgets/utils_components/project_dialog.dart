import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/body_controller.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/utils/utils_func.dart';
import '../../../common/constants/sizes.dart';
import '../buttons/primary_button.dart';

class ProjectViewDialog extends StatelessWidget {
  const ProjectViewDialog({super.key, required this.project, this.isDesktop = true});

  final bool isDesktop;
  final ProjectModel project;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0, ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Sizes.mdPadding),
          child: Container(
            padding: EdgeInsets.symmetric( horizontal:Sizes.mdPadding),
            constraints: BoxConstraints(maxWidth: 1024, ),
            decoration: BoxDecoration(
                color: context.isDarkMode?Color(0xff171616):context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadiusDirectional.circular(Sizes.mdBorderRd,)
            ),
            child: Center(
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: WidgetStatePropertyAll(context.theme.colorScheme.outlineVariant),
                  trackColor: WidgetStatePropertyAll(context.theme.colorScheme.outlineVariant.withOpacity(0.2))
                ),
                child: Scrollbar(
                  controller: scrollController,
                  trackVisibility: true,
                  thumbVisibility: true,
                  interactive: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: isDesktop?Column(children:[
                      SizedBox(height: Sizes.spaceBtwSectionsD,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Sizes.mdBorderRd),
                              child: Hero(
                                tag: "assets/images/8d5c76c22d7c791e98f8bdeb392691eb.jpg",
                                child: Image.asset(
                                  "assets/images/8d5c76c22d7c791e98f8bdeb392691eb.jpg",
                                  height: Sizes.mediumHeightD * 0.6,
                                  // width: Sizes.mediumHeightD * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Sizes.defaultSpaceD,),
                          Expanded(
                            child: projectInfo(context),
                          )
                        ],),
                      SizedBox(height: Sizes.spaceBtwSectionsD,),
                    ])
                    :Column(children:[
                      SizedBox(height: Sizes.spaceBtwSectionsM,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(project.title!, style: GoogleFonts.montserrat(textStyle: context.textTheme.displayMedium!.copyWith(fontSize: 23)),),

                          MaterialButton(
                            onPressed: Get.back,
                            shape: CircleBorder(),
                            child: Icon(Icons.close, color: context.theme.colorScheme.outline,),
                          ),
                        ],
                      ),
                      SizedBox(height: Sizes.defaultSpaceM,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.mdBorderRd),
                        child: Hero(
                          tag: "assets/images/8d5c76c22d7c791e98f8bdeb392691eb.jpg",
                          child: Image.asset(
                            "assets/images/8d5c76c22d7c791e98f8bdeb392691eb.jpg",
                            //height: Sizes.mediumHeightD * 0.6,
                             width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: Sizes.defaultSpaceM,),
                      projectInfo(context),
                      SizedBox(height: Sizes.spaceBtwSectionsM,),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget projectInfo(BuildContext context) {
    return Column(
      spacing: Sizes.defaultSpaceD,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isDesktop)Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(project.title!, style: GoogleFonts.montserrat(textStyle: context.textTheme.displayMedium!.copyWith(fontSize: 23)),),

            MaterialButton(
              onPressed: Get.back,
              shape: CircleBorder(),
              child: Icon(Icons.close, color: context.theme.colorScheme.outline,),
            ),
          ],
        ),
        SizedBox(height: Sizes.spaceBtwItems,),
        Text(project.description??'', style: context.textTheme.bodyLarge,),
        Text("Features", style: context.textTheme.titleLarge!.copyWith(fontSize: 20),),
        Row(children: [
          SizedBox(width: Sizes.spacingD,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(project.features!.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top:Sizes.spacingD),
                  child: RichText(text: TextSpan(
                      text: "${project.features![index].title}: ",
                      style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                      children: [
                        TextSpan(text: project.features![index].description, style:  context.textTheme.bodyLarge)
                      ]
                  )),
                );
              },),),
          )
        ],),

        Text("Technologies Used", style: context.textTheme.titleLarge!.copyWith(fontSize: 20),),
        Row(children: List.generate(project.techsUsed!.length, (index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: Sizes.spaceBtwItems),
            child: Column(
              spacing: Sizes.spaceBtwItems,
              children: [
                if(UtilsFunc.isSkillLogoInAsset(project.techsUsed![index]))SvgPicture.asset(
                  UtilsFunc.assetSkillLogo(project.techsUsed![index]),
                  fit: BoxFit.contain,
                  height: Sizes.defIconSize,
                )else SvgPicture.network(
                  UtilsFunc.findSkillLogoUrl(project.techsUsed![index], BodyController.instance.skills),
                  height: Sizes.defIconSize,
                  fit: BoxFit.contain,
                ),
                Text(project.techsUsed![index], style: context.textTheme.bodyMedium,)
              ],),
          );
        },),),
        SizedBox(height: Sizes.spacingD,),
        Align(
          alignment: isDesktop?Alignment.topLeft:Alignment.topRight,
          child: Material(
            borderRadius: BorderRadiusDirectional.circular(Sizes.smBorderRd),
            child: PrimaryButton(
                text: "View Project",
                icon: FontAwesomeIcons.github,
                borderRadius: Sizes.smBorderRd,
                onTap: () => BodyController.pLaunchUrl(project.githubLink!)
            ),
          ),
        )
      ],);
  }
}

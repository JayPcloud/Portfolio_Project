import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/body_controller.dart';
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/utils/utils_func.dart';
import 'package:portfolio/view/widgets/%20container/rounded_container.dart';
import 'package:portfolio/view/widgets/animations/scroll_entrance_animation.dart';
import '../../../common/constants/sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesktopSkillsMenu extends StatelessWidget {
  const DesktopSkillsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = BodyController.instance.skills;
    return ScrollEntrance(
      child: Padding(
        padding: EdgeInsets.only(
            right: Sizes.defaultSpaceD, top: Sizes.spaceBtwSectionsD * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: Sizes.spaceBtwItems,
              children: [
                Icon(
                  Icons.workspace_premium,
                  size: context.textTheme.labelMedium!.fontSize,
                ),
                Text(
                  "Skills",
                  style: context.textTheme.labelMedium,
                )
              ],
            ),
            SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            Text(
              "Skills & Expertise",
              style: GoogleFonts.montserrat(
                  textStyle:
                      context.textTheme.displayLarge!.copyWith(fontSize: 35)),
            ),
            SizedBox(
              height: Sizes.defaultSpaceD,
            ),
            Text(
              BodyController.instance.workRelatedInfo.skillsWriteUp??'',
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(
              height: Sizes.spaceBtwSectionsD,
            ),
            Text(
              "Frontend Development",
              style: GoogleFonts.montserrat(
                  textStyle: context.textTheme.displayMedium),
            ),
            SizedBox(
              height: Sizes.defaultSpaceD,
            ),
            skillsGridView(skills
                .where(
                  (skill) => skill.stack?.toLowerCase() == 'frontend',
                )
                .toList()),
            SizedBox(
              height: Sizes.spaceBtwSectionsD,
            ),
            Text(
              "Backend Development",
              style: GoogleFonts.montserrat(
                  textStyle: context.textTheme.displayMedium),
            ),
            SizedBox(
              height: Sizes.defaultSpaceD,
            ),
            skillsGridView(
              skills.where((skill) => skill.stack?.toLowerCase() == 'backend')
                  .toList(),
            ),
            SizedBox(
              height: Sizes.spaceBtwSectionsD,
            ),
            Text(
              "Cross-platform Development",
              style: GoogleFonts.montserrat(
                  textStyle: context.textTheme.displayMedium),
            ),
            SizedBox(
              height: Sizes.defaultSpaceD,
            ),
            skillsGridView(
              skills.where((skill) => skill.stack?.toLowerCase() == 'platform')
                  .toList(),
            ),
            SizedBox(
              height: Sizes.spaceBtwSectionsD,
            ),
            Text(
              "My favourite tools",
              style: GoogleFonts.montserrat(
                  textStyle: context.textTheme.displayMedium),
            ),
            SizedBox(
              height: Sizes.defaultSpaceD,
            ),
            skillsGridView(skills
                .where(
                  (skill) => skill.stack?.toLowerCase() == 'fav_tools',
                )
                .toList(), crossAxisCount: UtilsFunc.deviceWidth(context)<1100?5:6,spacing: Sizes.spaceBtwItems)
          ],
        ),
      ),
    );
  }

  Widget skillsGridView(List<SkillModel> skills, {int? crossAxisCount, double? spacing}) {
    return ScrollEntrance(
      offset: Offset(0.5,0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount??4,
            mainAxisSpacing: Sizes.spaceBtwItems,
            crossAxisSpacing: Sizes.spaceBtwItems,
            childAspectRatio: 1.5),
        physics: NeverScrollableScrollPhysics(),

        shrinkWrap: true,
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return RoundedContainer(
            borderRadius: Sizes.mdBorderRd,
            color: context.theme.colorScheme.onSurface,
            child: Padding(
              padding: EdgeInsets.all(Sizes.defPadding),
              child: Column(
                spacing: spacing??Sizes.spacingD,
                children: [
                  Expanded(
                      child: FittedBox(child: skillLogo(skill: skills[index]))),
                  FittedBox(fit:BoxFit.scaleDown, child: Text(skills[index].name!, style: context.textTheme.titleMedium))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget skillLogo({required SkillModel skill}) {
    if (UtilsFunc.isSkillLogoInAsset(skill.name!)) {
      if(skill.isSvg??true){
        return SvgPicture.asset(
          UtilsFunc.assetSkillLogo(skill.name!),
        );
      }else {
        return Image.asset(
        UtilsFunc.assetSkillLogo(skill.name!),
      );
      }

    } else {
      if(skill.isSvg??false) {
        return SvgPicture.network(
          skill.imageUrl!,
        );
      }else {
        return Image.network(
            skill.imageUrl!
        );
      }

    }
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/constants/sizes.dart';
import 'package:portfolio/controllers/body_controller.dart';
import 'package:portfolio/view/widgets/animations/scroll_entrance_animation.dart';
import '../../widgets/ container/project_card.dart';
import 'package:get/get.dart';

class DesktopProjectsMenu extends StatelessWidget {
  const DesktopProjectsMenu({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final projects = BodyController.instance.projects;
    return ScrollEntrance(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: Sizes.spaceBtwSectionsD * 2,),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: Sizes.spaceBtwItems,
            children: [
              Icon(FontAwesomeIcons.rProject, size: context.textTheme.labelMedium!.fontSize,),
              Text("Portfolio", style: context.textTheme.labelMedium,)
            ],),
      
            SizedBox(height: Sizes.spaceBtwItems,),
      
            Text("Check out my featured projects",
              style: GoogleFonts.montserrat(textStyle: context.textTheme.displayLarge!.copyWith(fontSize: 35)),
            ),
      
            SizedBox(height: Sizes.spacingD,),
      
            Padding(
              padding: const EdgeInsets.only(right: Sizes.defaultSpaceD),
              child:
              GridView.builder(
                itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: Sizes.defaultSpaceD,mainAxisSpacing: Sizes.defaultSpaceD,),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      height: constraints.maxHeight * 0.7,
                      borderRadius: Sizes.mdBorderRd,
                      project: projects[index],
                    );
                  },
              ),
            ),
      
      
        ],),
      ),
    );
  }
}

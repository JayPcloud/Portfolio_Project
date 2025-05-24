import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view/widgets/%20container/rounded_container.dart';
import '../../../common/constants/sizes.dart';
import '../../../data/models/project.dart';
import '../utils_components/project_dialog.dart';

class ProjectCard extends StatelessWidget {

   const ProjectCard({
    super.key,
     this.height, required this.project, this.borderRadius = Sizes.lgBorderRd, this.isDesktop = true,
  });

  final ProjectModel project;
  final double borderRadius ;
  final double? height;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    RxBool isHovered = false.obs;
    return MouseRegion(
      onEnter: (_) =>  isHovered.value = true,
      onExit: (_) =>  isHovered.value = false,
      child: GestureDetector(
        onTap:() {
          showDialog(
            barrierDismissible: true,
            barrierLabel: 'lorem',
            context: context,
            builder: (context) {
              return ProjectViewDialog(project: project, isDesktop: isDesktop,);
            },
          );
        },
        child: Obx(
          ()=> Stack(
            children: [
              AnimatedScale(
                scale: isHovered.value ? 1.03 : 1.0,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeOut,
                child: AnimatedContainer(
                  height: height,
                  // constraints: BoxConstraints(minHeight: Sizes.mediumHeightD),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: context.theme.primaryColorDark
                    // boxShadow: isHovered.value
                    //     ? [
                    //   BoxShadow(
                    //     color: Colors.blue.withOpacity(0.5),
                    //     blurRadius: 20,
                    //     spreadRadius: 2,
                    //     offset: Offset(0, 4),
                    //   ),
                    // ]
                    //     : [],
                  ),
                  child: Column(
                    spacing: Sizes.spacingD,
                    children: [
                      Expanded(
                        flex:3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)),
                          child: Hero(
                            tag: '',
                            child: Image.asset(
                              'assets/images/71bbad33e6a71401ef017a89df42a46a.jpg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              color: isHovered.value ? Colors.black.withOpacity(0.4) : null,
                              colorBlendMode: isHovered.value ? BlendMode.darken : BlendMode.dst,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(isDesktop?Sizes.defaultSpaceD:Sizes.defaultSpaceM),
                        child: Column(
                          spacing: isDesktop?Sizes.defaultSpaceD:Sizes.defaultSpaceM,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(project.title??'', style: context.textTheme.titleLarge,overflow: TextOverflow.ellipsis),
                            Text(project.description??'', style: context.textTheme.bodyLarge, maxLines:2, overflow: TextOverflow.ellipsis,)
                        ],),
                      )

                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: isHovered.value ? 1.0 : 0.0,
                child: Center(
                    child: RoundedContainer(
                      borderRadius: Sizes.smBorderRd,
                      padding: EdgeInsets.all(Sizes.defPadding),
                      color: Colors.black.withOpacity(0.7),
                      child: Text(
                          "View Details",
                          style: context.textTheme.titleLarge!.copyWith(color: Colors.white)
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

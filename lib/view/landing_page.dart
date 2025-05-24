import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/layout_controller.dart';
import 'package:portfolio/view/menu/desktop_view/about_me.dart';
import 'package:portfolio/view/menu/desktop_view/contact.dart';
import 'package:portfolio/view/menu/desktop_view/home.dart';
import 'package:portfolio/view/menu/desktop_view/portfolio_projects.dart';
import 'package:portfolio/view/menu/desktop_view/skills.dart';
import 'package:portfolio/view/menu/mobile_view/contact.dart';
import 'package:portfolio/view/menu/mobile_view/portfolio_projects.dart';
import 'package:portfolio/view/widgets/layout/desktop_layout.dart';
import 'package:portfolio/view/widgets/layout/mobile_layout.dart';
import 'package:portfolio/view/widgets/layout/responsive_widget.dart';
import 'menu/mobile_view/about_me.dart';
import 'menu/mobile_view/home.dart';
import 'menu/mobile_view/skills.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final layoutController = Get.put(LayoutController.instance);

    return ResponsiveWidget(

        mobileView: MobileLayout(
          body: (constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MobileHomeMenu(key: layoutController.menuKeys[0], constraints: constraints,),
              MobileProjectsMenu(key: layoutController.menuKeys[1], constraints: constraints,),
              MobileAboutMenu(key: layoutController.menuKeys[2], constraints: constraints,),
              MobileSkillsMenu(key: layoutController.menuKeys[3], constraints: constraints,),
              MobileContactMenu(key: layoutController.menuKeys[4],),
              SizedBox(height: constraints.maxHeight * 0.3,)
            ],
          ) ,),

        desktopView: DesktopLayout(
            body: (constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DesktopHomeMenu(key: layoutController.menuKeys[0], constraints: constraints,),
                DesktopProjectsMenu(key: layoutController.menuKeys[1],constraints: constraints),
                DesktopAboutMenu(key: layoutController.menuKeys[2],constraints: constraints),
                DesktopSkillsMenu(key: layoutController.menuKeys[3],),
                DesktopContactMenu(key: layoutController.menuKeys[4]),
                SizedBox(height: constraints.maxHeight * 0.3,)
              ],
            )));
  }
}

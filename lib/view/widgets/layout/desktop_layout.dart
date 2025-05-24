import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/constants/sizes.dart';
import 'package:portfolio/common/theme/theme_controller.dart';
import 'package:portfolio/controllers/layout_controller.dart';
import 'package:portfolio/utils/utils_func.dart';
import 'package:portfolio/view/widgets/animations/animated_top_bar.dart';
import 'package:portfolio/view/widgets/animations/scroll_entrance_animation.dart';
import 'package:portfolio/view/widgets/buttons/menu_button.dart';
import 'package:portfolio/view/widgets/buttons/primary_button.dart';
import 'components/desktop_sideBar.dart';


class DesktopLayout extends StatelessWidget {
   const DesktopLayout({super.key, required this.body});

  final Widget Function(BoxConstraints)  body;

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.put(LayoutController.instance);
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: layoutController.scrollController,
                child: Stack(children: [
                  //Container(color: Colors.pinkAccent,height: 1000,),
                  Padding(
                    padding: EdgeInsets.only(
                        left: UtilsFunc.deviceWidth(context)<1200?340:UtilsFunc.deviceWidth(context) * 0.22 + 60,
                        //top: Sizes.spaceBtwSectionsD,
                        right: 20
                    ),
                    child: body(constraints),
                  ),
                ],),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: UtilsFunc.deviceWidth(context) * 0.03,
                vertical: UtilsFunc.deviceHeight(context) * 0.03),
            child: Row(
              children: [
                ScrollEntrance(
                    offset: Offset(-0.3, 0),
                    child: DesktopSidebar()),
                SizedBox(width: Sizes.defaultSpaceD,),
                AnimatedTopBar(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      spacing: UtilsFunc.deviceWidth(context) * 0.02,
                      children: [
                        MenuButton(index: 0, text: 'Home', menuKey: layoutController.menuKeys[0],),
                        MenuButton(index: 1, text: 'Portfolio', menuKey: layoutController.menuKeys[1],),
                        MenuButton(index: 2, text: 'About Me', menuKey: layoutController.menuKeys[2],),
                        MenuButton(index: 3, text: 'Skills', menuKey: layoutController.menuKeys[3],),
                        MenuButton(index: 4, text: 'Contact', menuKey: layoutController.menuKeys[4],),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    spacing: UtilsFunc.deviceWidth(context) * 0.001,
                    children: [
                      IconButton(
                          onPressed:()=> ThemeController.changeThemeMode(context.isDarkMode), icon: Icon( context.isDarkMode?Icons.light_mode:Icons.dark_mode, size: Sizes.defIconSize, color: context.theme.colorScheme.outline,)),
                      PrimaryButton(
                        text: "Let's Talk",
                        icon: FontAwesomeIcons.rocketchat,
                        onTap: ()=>LayoutController.scrollToMenu(layoutController.menuKeys[4]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

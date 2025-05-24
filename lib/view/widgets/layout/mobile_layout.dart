import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/layout_controller.dart';
import 'package:portfolio/view/widgets/layout/components/mobile_drawer.dart';
import '../../../common/constants/sizes.dart';
import '../../../common/theme/theme_controller.dart';
import '../buttons/primary_button.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.body});

  final Widget Function(BoxConstraints)  body;

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.put(LayoutController.instance);
    return Scaffold(
      drawer: MobileDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context)=> InkWell(
             onTap: Scaffold.of(context).openDrawer,
              child: Icon(Icons.menu, color: context.theme.colorScheme.primary,),
            )
        ),
        actions: [
          IconButton(
              onPressed:()=> ThemeController.changeThemeMode(context.isDarkMode), icon: Icon( context.isDarkMode?Icons.light_mode:Icons.dark_mode, size: Sizes.defIconSize, color: context.theme.colorScheme.outline,)),
          Padding(
            padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
            child: PrimaryButton(
              text: "Let's Talk",
              icon: FontAwesomeIcons.rocketchat,
              onTap: ()=>LayoutController.scrollToMenu(layoutController.menuKeys[4]),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context,constraints) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: layoutController.scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpaceM),
                child: body(constraints),
              ));
        }
      ),
    );
  }
}
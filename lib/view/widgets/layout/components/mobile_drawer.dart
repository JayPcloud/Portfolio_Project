import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/layout_controller.dart';
import '../../../../common/constants/sizes.dart';
import '../../../../utils/utils_func.dart';
import '../../animations/scroll_entrance_animation.dart';
import '../../buttons/menu_button.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutController = LayoutController.instance;
    return Container(
      padding: EdgeInsets.all(Sizes.mdPadding),
      width: UtilsFunc.deviceWidth(context) * 0.6,
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          //border: Border.all(color: context.theme.colorScheme.surface, width: Sizes.smBorderWidth,),
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(Sizes.lgBorderRd),
              bottomEnd: Radius.circular(Sizes.lgBorderRd)
          )
      ),

      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Builder(
                builder: (context)=> InkWell(
                  onTap: Scaffold.of(context).closeDrawer,
                  child: Icon(Icons.close),)
            ),
          ),
          ScrollEntrance(
            duration: Duration(milliseconds: 700),
            child: Column(children: List.generate(
              layoutController.menuTexts.length, (index) {
              return MenuButton(isDesktop: false,index: index, text: layoutController.menuTexts[index], menuKey: layoutController.menuKeys[index],);
            },
            ) ,),
          ),
        ],
      ),
    );
  }
}

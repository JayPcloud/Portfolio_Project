import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/layout_controller.dart';
import '../../../common/constants/sizes.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.index, required this.text, required this.menuKey, this.isDesktop = true});

  final int index;
  final String text;
  final GlobalKey menuKey;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final LayoutController controller = LayoutController.instance;
    Rx<Color?> textColor =  context.textTheme.labelSmall!.color.obs;

    if(isDesktop) {
      return Obx(
            () => MouseRegion(
          onEnter: (event) => textColor.value = context.textTheme.labelMedium!.color,
          onExit: (event)=> textColor.value = context.textTheme.labelSmall!.color,
          child: MaterialButton(

            padding: EdgeInsets.all(Sizes.defPadding),
            color: context.isDarkMode?Color(0x15212121)
                :Color(0xffefeeee),
            onPressed: () => controller.onMenuTap(index, menuKey),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(Sizes.lgBorderRd),
                side: controller.currentMenuIndex.value == index
                    ? BorderSide(
                    color: context.theme.colorScheme.outline,
                    width: Sizes.smBorderWidth)
                    : BorderSide.none),
            child: Text(
              text,
              style: controller.currentMenuIndex.value != index?context.textTheme.labelSmall!.copyWith(color: textColor.value):context.textTheme.labelMedium!.copyWith(fontSize: 14),
            ),
          ),
        ),
      );
    }else {
      return Obx(
        ()=> ListTile(
          minVerticalPadding: Sizes.spaceBtwItems,
          title: Text(
            text,
            style: controller.currentMenuIndex.value != index?context.textTheme.labelSmall:context.textTheme.labelMedium!.copyWith(fontSize: 14),
          ),
          selected: controller.currentMenuIndex.value == index,
          selectedTileColor: context.theme.colorScheme.surface,
          onTap: () {
            controller.onMenuTap(index, menuKey);
            Scaffold.of(context).closeDrawer();
          }
        ),
      );
    }

  }
}

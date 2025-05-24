import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {

  LayoutController._();

  static LayoutController instance = LayoutController._();

  @override
  void onInit() {
    scrollController.addListener(() {
      for (int i = 0; i < menuKeys.length; i++) {
        final keyContext = menuKeys[i].currentContext;
        if (keyContext != null) {
          final box = keyContext.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero).dy;
          if (position >= 0 && position < 300) {
            // If in viewport top area (adjust threshold)
             currentMenuIndex.value = i;
            break;
          }
        }
      }
    });

    super.onInit();
  }

  RxInt currentMenuIndex = 0.obs;

  final ScrollController scrollController = ScrollController();


  List<GlobalKey> menuKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  List<String> menuTexts = [
    "Home",
    "Portfolio",
    "About Me",
    "Skills",
    "Contact",
  ];

  final GlobalKey socialContactWidgetKey = GlobalKey();
  // final homeMenuKey = GlobalKey();
  // final portfolioMenuKey = GlobalKey();
  // final resumeMenuKey = GlobalKey();
  // final aboutMeMenuKey = GlobalKey();
  // final contactMenuKey = GlobalKey();

  void onMenuHover(bool hover)=> hover = true;

  static void scrollToMenu(GlobalKey key) {
    final BuildContext? context = key.currentContext;
    if(context != null) {
      Scrollable.ensureVisible(
        context,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 500)
      );
    }
  }

  void onMenuTap(int val, GlobalKey menuKey) {
    if(currentMenuIndex.value != val) {
      currentMenuIndex.value = val;
      scrollToMenu(menuKey);
    }
  }


}
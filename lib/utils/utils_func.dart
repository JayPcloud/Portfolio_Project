import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/constants/texts.dart';
import 'package:portfolio/data/models/skill_model.dart';

class UtilsFunc {
  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isSkillLogoInAsset(String skillName) {
    final name = skillName.toLowerCase();
    if (name == 'flutter' ||
        name == 'dart' ||
        name == 'firebase' ||
        name == 'cloud firestore' ||
        name == 'figm' ||
        name == 'python' ||
        name == 'django' ||
        name == 'android studio' ||
        name == 'vs code' ||
        name == 'git' ||
        name == 'github' ||
        name == 'web') {
      return true;
    } else {
      return false;
    }
  }

  static String assetSkillLogo(String skillName) {
    final name = skillName.toLowerCase();
    switch (name) {
      case 'flutter' || 'flutter web':
        return Texts.flutterAssetLogoSvg;
      case 'dart':
        return Texts.dartAssetLogoSvg;
      case 'firebase':
        return Texts.firebaseAssetLogoSvg;
      case 'figma':
        return Texts.figmaAssetLogoSvg;
      case 'python':
        return Texts.pythonAssetLogoSvg;
      case 'django':
        return Texts.djangoAssetLogoSvg;
      case 'android studio':
        return Texts.androidStudioAssetLogoSvg;
      case 'vs code':
        return Texts.vsCodeAssetLogoSvg;
      case 'git':
        return Texts.gitAssetLogoSvg;
      case 'github':
        return Texts.githubAssetLogoSvg;
      case 'web':
        return Texts.webAssetLogoPng;
      case 'cloud firestore':
        return Texts.cloudAssetLogoSvg;
      default:
        return '';
    }
  }

  static String findSkillLogoUrl(
      String skillName, List<SkillModel> listOfSkills) {
    final name = skillName.toLowerCase();
    final skill =
        listOfSkills.where((e) => e.name!.toLowerCase() == name).toList();
    return skill[0].imageUrl ?? '';
  }

  static showSnackBar(
      {required String message, required BuildContext context, Widget? titleWidget, double? maxWidth}) {
    Get.closeAllSnackbars();
    Get.snackbar('', '',
        titleText: titleWidget,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        isDismissible: true,
        duration: Duration(seconds: 3),
        maxWidth: maxWidth??deviceWidth(context) *0.5,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(seconds: 1),
        mainButton: TextButton(onPressed: Get.closeAllSnackbars, child: Icon(Icons.close, color: context.theme.colorScheme.outline,)),
        messageText: Text(
          message,
          style: GoogleFonts.montserrat(textStyle: context.textTheme.bodyLarge),
        )
    );
  }

  static String? textFieldValidator(String text, bool? required) {
    if (required == true) {
      if (text.trim().isEmpty) {
        return 'required field';
      }
    }

    return null;
  }
}

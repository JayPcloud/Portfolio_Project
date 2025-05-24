import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController{

  // final _getStorage =  GetStorage();
  // final _key = 'isDarkMode';
  // ThemeMode getThemeMode (){
  //   return isSavedDarkMode()? ThemeMode.dark : ThemeMode.light;
  // }
  //
  // bool isSavedDarkMode ()  {
  //   return _getStorage.read(_key)??false;
  // }
  // void saveThemeMode (bool isDarkMode)  {
  //   _getStorage.write(_key, isDarkMode);
  // }

  static void changeThemeMode (bool isDarkMode) {
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    // saveThemeMode(!isSavedDarkMode());
  }



}
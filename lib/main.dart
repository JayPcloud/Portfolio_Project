import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/theme/themeData.dart';
import 'package:portfolio/view/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/body_controller.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await BodyController.instance.fetchPortfolioData();
  print(BodyController.instance.skills[1].name);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: PTheme.lightTheme,
      darkTheme: PTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

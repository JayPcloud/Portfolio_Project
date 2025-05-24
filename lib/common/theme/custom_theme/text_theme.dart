import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class PTextTheme {

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(color: PColors.primaryAccentLT, fontSize: 25, fontWeight: FontWeight.w600),
    displayMedium: TextStyle(color: PColors.primaryTextLT, fontSize: 25, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(color: PColors.primaryTextLT, fontSize: 18, fontWeight: FontWeight.w700),

    bodyLarge: TextStyle(color: PColors.primaryTextLT, fontSize: 15, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(color: PColors.primaryTextLT, fontSize: 14, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(color: PColors.secondaryTextLT, fontSize: 14, fontWeight: FontWeight.w500),

    titleLarge: GoogleFonts.montserrat(textStyle: TextStyle(color: PColors.primaryTextLT, fontSize: 16, fontWeight: FontWeight.w600)),
    titleMedium: GoogleFonts.montserrat(textStyle: TextStyle(color: PColors.primaryTextLT, fontSize: 14, fontWeight: FontWeight.w600),),
    titleSmall: TextStyle(color: PColors.secondaryTextLT, fontSize: 14, fontWeight: FontWeight.w600),

    labelLarge: TextStyle(color: PColors.primaryLabelTextLT, fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(color: PColors.primaryTextLT, fontSize: 13, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(color: PColors.secondaryTextLT, fontSize: 13  , fontWeight: FontWeight.w500),


  );

  static TextTheme darkTextTheme = TextTheme(

    displayLarge: const TextStyle(color: PColors.primaryAccentDT, fontSize: 25, fontWeight: FontWeight.w600),
    displayMedium: const TextStyle(color: PColors.primaryTextDT, fontSize: 25, fontWeight: FontWeight.w600),
    displaySmall: const TextStyle(color: PColors.primaryTextDT, fontSize: 18, fontWeight: FontWeight.w700),

    bodyLarge: const TextStyle(color: PColors.primaryTextDT, fontSize: 15, fontWeight: FontWeight.w500),
    bodyMedium: const TextStyle(color: PColors.primaryTextDT, fontSize: 14, fontWeight: FontWeight.w500),
    bodySmall: const TextStyle(color: PColors.secondaryTextDT, fontSize: 14, fontWeight: FontWeight.w500),

    titleLarge: GoogleFonts.montserrat(textStyle: TextStyle(color: PColors.primaryTextDT, fontSize: 16, fontWeight: FontWeight.w600)),
    titleMedium: GoogleFonts.montserrat(textStyle:TextStyle(color: PColors.primaryTextDT, fontSize: 14, fontWeight: FontWeight.w600),),
    titleSmall: const TextStyle(color: PColors.secondaryTextDT, fontSize: 14, fontWeight: FontWeight.w600),

    labelLarge: const TextStyle(color: PColors.primaryLabelTextDT, fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: const TextStyle(color: PColors.primaryTextDT, fontSize: 13, fontWeight: FontWeight.w500),
    labelSmall: const TextStyle(color: PColors.secondaryTextDT, fontSize: 13  , fontWeight: FontWeight.w500),

  );
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medcave/core/confiq/colors/appcolor.dart';

class AppTheme {
  static final theme = ThemeData(
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColor.backgroundGrey,
    primaryColor: AppColor.primaryGreen,
    fontFamily: GoogleFonts.instrumentSans().fontFamily,
    cardColor: AppColor.backgroundWhite,
  );
}

import 'package:wcars/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: const CustomTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColorScheme.primaryColor))),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColorScheme.background,
        elevation: 4,
      ),
      primarySwatch: AppColorScheme.mcgpalette0,
      scaffoldBackgroundColor: AppColorScheme.background);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: const CustomTextTheme(),
      primarySwatch: AppColorScheme.mcgpalette0,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColorScheme.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red)))),
      ),
      scaffoldBackgroundColor: AppColorScheme.background);
}

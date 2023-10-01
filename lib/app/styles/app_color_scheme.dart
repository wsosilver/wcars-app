import 'package:flutter/material.dart';

class AppColorScheme {
  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    backgroundColor: const Color(0xffFFFFFF),
    accentColor: Colors.amber,
    primarySwatch: mcgpalette0,
    errorColor: feedbackDangerBase,
  ).copyWith(onPrimary: white);

  /// http://mcg.mbitson.com/
  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFF7F6F6),
    100: Color(0xFFEBEAEA),
    200: Color(0xFFDEDCDC),
    300: Color(0xFFD1CDCD),
    400: Color(0xFFC7C3C3),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFFB7B1B1),
    700: Color(0xFFAEA8A8),
    800: Color(0xFFA6A0A0),
    900: Color(0xFF989191),
  });
  static const int _mcgpalette0PrimaryValue = 0xFFBDB8B8;

  static const MaterialColor mcgpalette0Accent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFFFFCECE),
    700: Color(0xFFFFB4B4),
  });
  static const int _mcgpalette0AccentValue = 0xFFFFFFFF;

  static const primaryColors = Color(0xFF1E2730);

  static const int primaryswatchAccentValue = 0xFFFFEBE3;
  static const int back = 0xFFFFEBE3;
  static const Color black = Color(0xff000000);
  static const Color blackCinza = Color(0xff464646);
  static const Color white = Color(0xffFFFFFF);
  static const Color background = Color(0xffF5F6FA);
  static const Color fontBold = Color(0xff464646);
  static const Color input = Color(0xff192027);
  static const Color red = Colors.red;
  static const Color grey = Color(0xffBDB8B8);
  static const Color orange = Colors.orange;
  static Color colorWpp = Colors.green.shade800;

  static const primaryColor = Color(0xFFf58218);
  static const primaryColorButton = Color(0xFFFF4941);
  static const primaryColor50 = Color(0xFFFFEBE3);

  static const neutralWhite2A = Color.fromRGBO(255, 255, 255, 0.1);
  static const neutralDefault2 = Color(0xff616e7c);
  static const neutralLight2 = Color(0xffcfdae5);
  static const neutralLighest2 = Color(0xfff2f4f7);
  static const neutralMedium2 = Color(0xff9aa5b1);
  static const neutralMedium3 = Color(0xff757575);
  static const neutralDark2 = Color(0xff1f2933);

  static const feedbackWarningDefault2 = Color(0xffffc300);
  static const feedbackWarningLighest2 = Color(0xfffff7de);
  static const feedbackWarningDark2 = Color(0xffcc9c00);
  static const feedbackWarningLight2 = Color(0xffffe799);
  static const feedbackWarningMedium2 = Color(0xffffdb66);
  static const feedbackDangerLighest = Color(0xfffeebed);
  static const feedbackDangerLight = Color(0xfffccdd1);
  static const feedbackDangerMedium = Color(0xfff6727f);
  static const feedbackDangerBase = Color(0xfff23548);
  static const feedbackDangerDark = Color(0xffff0000);
  static const feedbackSuccessDefault2 = Color(0xff00e484);
  static const feedbackSuccessLighest2 = Color(0xffebfaf3);
  static const feedbackSuccessLight2 = Color(0xff9dfad3);
  static const feedbackSuccessMedium2 = Color(0xff66efb5);
  static const feedbackSuccessDark2 = Color(0xff00cc76);
}

import 'package:wcars/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  //https://m2.material.io/design/typography/the-type-system.html exemplo de uso para cada tamanho de letra
  const CustomTextTheme({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? labelLarge,
    TextStyle? bodySmall,
    TextStyle? labelSmall,
  }) : super(
          displayLarge: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 79,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5),
          displayMedium: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 49,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5),
          displaySmall: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 39,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400),
          headlineLarge: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 5,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400),
          headlineMedium: const TextStyle(
            fontFamily: 'Helvetica',
            fontSize: 28,
            color: AppColorScheme.fontBold,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
          ),
          headlineSmall: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 20,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w200),
          titleLarge: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 20,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w200,
              letterSpacing: 0.15),
          titleMedium: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 13,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15),
          titleSmall: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 11,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1),
          bodyLarge: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 13,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
          /*padrão text*/ bodyMedium: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 16,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25),
          /* button */ labelLarge: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 13,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25),
          bodySmall: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 10,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4),
          labelSmall: const TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 8,
              color: AppColorScheme.fontBold,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5),
        );
}

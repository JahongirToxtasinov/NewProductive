import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static darkTheme() => ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: textButtonColor,
        )),
    fontFamily: 'Barlow',
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    drawerTheme: const DrawerThemeData(
      backgroundColor: scaffoldBackgroundColor,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: appBarColor),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: scaffoldBackgroundColor,
      onPrimary: onPrimaryColor,
      secondary: secondaryColor,
      onSecondary: onPrimaryColor,
      error: errorColor,
      onError: onPrimaryColor,
      background: scaffoldBackgroundColor,
      onBackground: onPrimaryColor,
      surface: scaffoldBackgroundColor,
      onSurface: onPrimaryColor,
    ),
        textTheme:  TextTheme(
          displayLarge: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: white,
          ),
          displayMedium: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: white,
          ),
          headlineMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          headlineSmall: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: blue,
          ),
          bodyLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: white,
          ),
          bodyMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: white
          ),
          labelSmall: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: grey2,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: white.withOpacity(0.6)
          ),
          titleSmall: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: white
          ),
        ),
      );
}

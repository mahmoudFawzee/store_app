import 'package:flutter/material.dart';
import 'package:store_app/view/resources/colors_manger.dart';

class ThemeManger {
  static ThemeData getLightMode() => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsManger.white,
          onPrimary: ColorsManger.red,
          secondary: ColorsManger.white,
          onSecondary: ColorsManger.white,
          error: ColorsManger.white,
          onError: ColorsManger.white,
          background: ColorsManger.white,
          onBackground: ColorsManger.white,
          surface: ColorsManger.white,
          onSurface: ColorsManger.white,
        ),
      );
  static ThemeData getDarkMode() => ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsManger.white,
          onPrimary: ColorsManger.red,
          secondary: ColorsManger.white,
          onSecondary: ColorsManger.white,
          error: ColorsManger.white,
          onError: ColorsManger.white,
          background: ColorsManger.white,
          onBackground: ColorsManger.white,
          surface: ColorsManger.white,
          onSurface: ColorsManger.white,
        ),
      );
}

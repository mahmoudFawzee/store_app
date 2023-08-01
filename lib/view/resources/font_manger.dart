import 'package:flutter/material.dart';
import 'package:store_app/view/resources/colors_manger.dart';

class FontManger {
  static const _fontFamily = "Tajawal";

  static TextStyle _customTextStyle({
    required Color fontColor,
    required FontWeight fontWeight,
    required double fontSize,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        color: fontColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
//**************************************************************************
  static getExtraLightFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.black,
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
      );

  static getWhiteExtraLightFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
      );
//**************************************************************************
  static getLightFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.black,
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      );

  static getWhiteLightFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      );
//**************************************************************************
  static getRegularFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.black,
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );

  static getWhiteRegularFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );
//**************************************************************************
  static getMediumFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.black,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );

  static getWhiteMediumFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );
//**************************************************************************

  static getBoldFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.black,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      );

  static getWhiteBoldFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      );
//**************************************************************************
  static getExtraBoldFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.black,
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      );

  static getWhiteExtraBoldFont({
    required double fontSize,
  }) =>
      _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      );

//**************************************************************************

  static getElevatedButtonFont() => _customTextStyle(
        fontColor: ColorsManger.white,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      );
}

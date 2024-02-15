import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  Color color,
  FontWeight fontWeight,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular fontstyles
TextStyle getRegularStyle(
    {fontSize = FontSize.s14,
    required Color color,
    fontWeight = FontWeightManager.normal}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    color,
    fontWeight,
  );
}

TextStyle getHeadingStyle({fontSize = FontSize.s40, required color}) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    height: 8,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle getHeadingStyle2({fontSize = FontSize.s30, required color}) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    color: color,
  );
}

// light fonstyle
TextStyle getLightStyle({
  fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    color,
    FontWeightManager.light,
  );
}

// bold fonstyle
TextStyle getBoldStyle({
  fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    color,
    FontWeightManager.bold,
  );
}

// medium fonstyle
TextStyle getmediumStyle({
  fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    color,
    FontWeightManager.medium,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterecommerceapp/ResourcesItems/Fonts.dart';
import 'package:flutterecommerceapp/ResourcesItems/Padding.dart';
import 'package:flutterecommerceapp/ResourcesItems/TextStyle.dart';
import 'package:flutterecommerceapp/Utils/Colors.dart';

//Light Dark Theme
ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    disabledColor: backgroundLite,
    scaffoldBackgroundColor: backgroundLite,

    // dialog theme
    dialogTheme: const DialogTheme(
      backgroundColor: backgroundLite,
      titleTextStyle: TextStyle(color: Colors.black),
      contentTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),

//bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: backgroundLite,
    ),

//card theme
    cardTheme: CardTheme(
      color: cardsLite,
      shadowColor: Colors.grey,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
    ),

// button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      shape: StadiumBorder(),
      disabledColor: backgroundLite,
    ),

// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s8,
          ),
        ),
        backgroundColor: primaryColor,
        disabledBackgroundColor: accentColor,
        disabledForegroundColor: Colors.white,
        textStyle: getRegularStyle(
          color: Colors.white,
          fontSize: FontSize.s14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),

//input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: textBoxLite,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
        borderSide: const BorderSide(color: textBoxLite),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
        borderSide: const BorderSide(
          color: textBoxLite,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: const BorderSide(color: textBoxLite),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppMargin.m8),
        borderSide: const BorderSide(color: textBoxLite),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: const BorderSide(color: textBoxLite),
      ),
      labelStyle: getRegularStyle(
        color: Colors.black,
      ),
      hintStyle: getRegularStyle(
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      errorStyle: getRegularStyle(
        color: Colors.red,
      ),
      suffixIconColor: primaryColor,
      suffixStyle: getRegularStyle(
        color: Colors.grey,
      ),
    ),

// app bar theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: AppSize.s40,
      ),
      color: Colors.transparent,
      elevation: AppSize.s0,
      titleTextStyle: getRegularStyle(
        color: Colors.black,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

// text theme
    textTheme: TextTheme(
      headline1: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
      caption: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s12,
      ),
      bodyText1: getRegularStyle(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey,
    ),
  );
}

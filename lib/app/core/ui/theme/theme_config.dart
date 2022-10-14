import 'package:flutter/material.dart';

import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class ThemeConfig {

  ThemeConfig._();

  static final _colorsApp  = ColorsApp.instance;
  static final _textStyles = TextStyles.instance;

  static final _defaultInputerBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(
      color: _colorsApp.greyDart,
      width: 1,
    ),
  );

  static final theme = ThemeData(
    primaryColor: _colorsApp.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _colorsApp.primary,
      primary: _colorsApp.primary,
      secondary: _colorsApp.secondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _colorsApp.white,
      elevation: 0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: _colorsApp.black,
      ),
      titleTextStyle: _textStyles.textPrimaryFontBold.copyWith(
        color: _colorsApp.black,
        fontSize: 18,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _colorsApp.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: _textStyles.labelTextField,
      border: _defaultInputerBorder,
      focusedBorder: _defaultInputerBorder,
      enabledBorder: _defaultInputerBorder,
    ),
  );

}

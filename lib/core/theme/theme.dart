import 'package:flutter/material.dart';
import 'package:richie_the_waiter/core/colors.dart';

final ThemeData themeForest = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: ForestColors.oldTudor.color ?? Colors.black),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: ForestColors.oldTudor.color),
    headlineMedium: TextStyle(
        color: ForestColors.valleyView.color, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(color: ForestColors.goldenFog.color),
  ),
  scaffoldBackgroundColor: ForestColors.goldenFog.color,
  appBarTheme: AppBarTheme(
    backgroundColor: ForestColors.goldenFog.color,
    iconTheme: IconThemeData(color: ForestColors.oldTudor.color),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: ForestColors.valleyView.color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  width: 1.5, color: ForestColors.valleyView.color!)))),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: ForestColors.oldTudor.color,
        foregroundColor: ForestColors.goldenFog.color,
        shape: const LinearBorder()),
  ),
  cardTheme: CardTheme(
    color: ForestColors.goldenFog.color,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ForestColors.valleyView.color,
      unselectedIconTheme: IconThemeData(color: ForestColors.aloeCream.color),
      selectedIconTheme: IconThemeData(color: ForestColors.goldenFog.color)),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: ForestColors.oldTudor.color),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ForestColors.warmCognac.color!)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ForestColors.oldTudor.color!)),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: ForestColors.goldenFog.color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

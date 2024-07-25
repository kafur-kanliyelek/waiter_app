import 'package:flutter/material.dart';

enum ForestColors {
  goldenFog,
  aloeCream,
  valleyView,
  warmCognac,
  oldTudor,
}

extension ForestColorExtension on ForestColors {
  Color? get color {
    switch (this) {
      case ForestColors.goldenFog:
        return const Color(0xffF0EAD2);
      case ForestColors.aloeCream:
        return const Color(0xffDDE5B6);
      case ForestColors.valleyView:
        return const Color(0xffADC178);
      case ForestColors.warmCognac:
        return const Color(0xffA98467);
      case ForestColors.oldTudor:
        return const Color(0xff6C584C);
      default:
        return Colors.white;
    }
  }
}

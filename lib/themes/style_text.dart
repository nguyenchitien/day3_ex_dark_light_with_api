import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/themes/font_family.dart';
import 'package:flutter/material.dart';

class StylesText {
  static const h1 = TextStyle(
    fontSize: Dimens.font_sp32,
    fontFamily: FontFamily.fAvenirNextLTPro,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );

  static const h2 = TextStyle(
    fontSize: Dimens.font_sp20,
    fontFamily: FontFamily.fAvenirNextLTPro,
  );

  static const h3 = TextStyle(
    fontSize: Dimens.font_sp16,
    fontFamily: FontFamily.fAvenirNextLTPro,
  );

  static const sub1 = TextStyle(
    fontSize: Dimens.font_sp12,
    fontFamily: FontFamily.fAvenirNextLTPro,
  );
}

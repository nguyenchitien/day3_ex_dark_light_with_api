import 'package:flutter/material.dart';

class Dimens {
  static const double font_sp12 = 12;
  static const double font_sp14 = 14;
  static const double font_sp16 = 16;
  static const double font_sp18 = 18;
  static const double font_sp20 = 20;
  static const double font_sp24 = 24;
  static const double font_sp28 = 28;
  static const double font_sp32 = 32;

  static const double gap_dp8 = 8;
  static const double gap_dp16 = 16;
  static const double gap_dp24 = 24;
  static const double gap_dp32 = 32;
}

class Gaps {
  /// horizontal
  static Widget hGap8 = const SizedBox(width: Dimens.gap_dp8);
  static Widget hGap16 = const SizedBox(width: Dimens.gap_dp16);
  static Widget hGap24 = const SizedBox(width: Dimens.gap_dp24);
  static Widget hGap32 = const SizedBox(width: Dimens.gap_dp32);

  /// vertical
  static Widget vGap16 = const SizedBox(height: Dimens.gap_dp16);
  static Widget vGap24 = const SizedBox(height: Dimens.gap_dp24);
  static Widget vGap32 = const SizedBox(height: Dimens.gap_dp32);
}

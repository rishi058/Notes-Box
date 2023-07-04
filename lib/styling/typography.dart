import 'package:flutter/material.dart';
import 'package:notes_box/Sizer/sizer.dart';
import 'package:notes_box/styling/colors.dart';

TextStyle theme(
    {double? sz, Color? clr, double? sp, FontWeight? wt, FontStyle? st}) {
  double size = 5;
  Color color = CustomColors().white;
  double space = 0.5;
  FontStyle style = FontStyle.normal;

  if (sz != null) {
    size = sz;
  }
  if (clr != null) {
    color = clr;
  }

  if (sp != null) {
    space = sp;
  }

  if (st != null) {
    style = st;
  }

  return TextStyle(
      fontSize: size.w,
      color: color,
      fontWeight: wt,
      letterSpacing: space,
      fontStyle: style,
  );
}
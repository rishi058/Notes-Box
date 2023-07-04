import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext ctx, String body, Color clr){
  return ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          content: Text(body),
          backgroundColor: clr,
      )
  );
}


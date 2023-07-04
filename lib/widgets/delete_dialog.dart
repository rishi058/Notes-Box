import 'dart:async';
import 'package:flutter/material.dart';


Future<bool> showAlert(BuildContext ctx) {
  Completer<bool> completer = Completer<bool>();

  showDialog(
    barrierDismissible: false,
    context: ctx,
    builder: (ctx) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to remove this Note entry?'),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(ctx).pop(false);
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(ctx).pop(true);
          },
        ),
      ],
    ),
  ).then((value) => completer.complete(value));

  return completer.future;
}
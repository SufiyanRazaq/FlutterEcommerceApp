import 'package:flutter/material.dart';
import 'package:flutterecommerceapp/Utils/YesNo.dart';

Widget textAction(String text, YesNo operation, BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        switch (operation) {
          case YesNo.no:
            Navigator.of(context).pop(false);
            break;
          case YesNo.yes:
            Navigator.of(context).pop(true);
            break;
          default:
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ));
}

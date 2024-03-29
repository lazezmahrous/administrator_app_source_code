import 'package:flutter/material.dart';
import 'package:hessen_app/constanc.dart';

void showSnackBarEror(context, String message, int days) {
  days != 0
      ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(days: days),
          backgroundColor: Colors.redAccent,
          content: Text(
            message,
            style: const TextStyle(),
          ),
        ))
      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            message,
            style: const TextStyle(),
          ),
        ));
}

void showSnackBarSuccess({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(),
      ),
      backgroundColor: Constanc.kColorGreen,
    ),
  );
}

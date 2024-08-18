import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'DISMISS',
        textColor: Colors.black,
        onPressed: () {
          // Optional: Handle dismiss action
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}

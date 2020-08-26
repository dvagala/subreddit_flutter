import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showMessage(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

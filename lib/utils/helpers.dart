import 'package:flutter/material.dart';

class Helpers {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

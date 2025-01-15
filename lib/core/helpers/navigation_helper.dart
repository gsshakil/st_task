import 'package:flutter/material.dart';

class NavigationHelper {
  static pushNamed(context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  static pop(context) {
    Navigator.of(context).pop();
  }
}

import 'package:flutter/material.dart';

extension NavigatorContext on BuildContext {
  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop();
  }

  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String routeName,
      {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?>(String routeName,
      {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName);
  }
}

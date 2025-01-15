// Flutter imports:
import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget borderAll(
    Color color, {
    double width = 1.5,
    double radius = 0.0,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: this,
      );

  Widget padding({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
          child: this);

  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: this);
}

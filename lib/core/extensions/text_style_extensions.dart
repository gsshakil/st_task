import 'package:flutter/material.dart';

extension TextStyleExtenions on TextStyle {
  TextStyle italic() {
    return copyWith(fontStyle: FontStyle.italic);
  }

  TextStyle bold({FontWeight? weight}) {
    return copyWith(fontWeight: weight ?? FontWeight.w600);
  }

  TextStyle semiBold() {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle size(double size) {
    return copyWith(fontSize: size);
  }

  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}

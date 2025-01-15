import 'package:flutter/material.dart';

ValueNotifier themeMode = ValueNotifier<ThemeMode>(ThemeMode.light);
ValueNotifier<Locale> selectedLocal = ValueNotifier<Locale>(const Locale('bn'));

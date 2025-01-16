import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:st_task/core/constants/app_constants.dart';
import 'package:st_task/core/value_notifiers.dart';

class ThemeUtils {
  ThemeUtils._();

  static final instance = ThemeUtils._();

  void initialize() async {
    const storage = FlutterSecureStorage();
    final String? selectedThemeMode =
        await storage.read(key: AppConstants.themeModeKey);

    if (selectedThemeMode != null) {
      themeMode.value = selectedThemeMode == 'ThemeMode.light'
          ? ThemeMode.light
          : ThemeMode.dark;
      return;
    } else {
      themeMode.value = ThemeMode.light;
    }

    Logger().i('Selected theme: ${themeMode.value}');
  }

  static void toggleThemeMode() {
    const storage = FlutterSecureStorage();

    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    }
    storage.write(
        key: AppConstants.themeModeKey, value: themeMode.value.toString());
  }
}

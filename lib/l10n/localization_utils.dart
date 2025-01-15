import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:st_task/core/constants/app_constants.dart';
import 'package:st_task/core/value_notifiers.dart';

class LocalizationUtils {
  LocalizationUtils._();

  static final instance = LocalizationUtils._();

  final storage = const FlutterSecureStorage();

  late Locale _locale;

  Locale get locale => _locale;

  /// Sets the app's locale initially. (Default is English-US)
  void initialize() async {
    final String? localLanguageCode =
        await storage.read(key: AppConstants.languageCodeKey);
    if (localLanguageCode != null) {
      selectedLocal.value = Locale(localLanguageCode);
      return;
    } else {
      selectedLocal.value = const Locale('en', 'US');
    }

    log('Selected Language Code: ${selectedLocal.value}');
  }

  void changeLocale({required Locale locale, required bool systemDefault}) {
    selectedLocal.value = locale;
    storage.write(
        key: AppConstants.languageCodeKey, value: locale.languageCode);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/app_shared_pref.dart';
import 'ar_AR/ar_ar_translation.dart';
import 'en_US/en_us_translation.dart';

class LocalizationService extends Translations {
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance = LocalizationService._();
    return _instance!;
  }

  static Locale defaultLanguage = supportedLanguages['en']!;

  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'AR'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ar_AR': arAr,
      };

  static Locale getCurrentLocal() {
    final langCode = AppSharedPreference.getLocal();
    return LocalizationService.supportedLanguages[langCode] ??
        LocalizationService.defaultLanguage;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../controller/settings_controller.dart';
import 'language_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              Strings.settings.tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              Strings.language.tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          LanguageItem(title: Strings.english.tr, languageCode: 'en'),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
            height: 0,
          ),
          LanguageItem(title: Strings.arabic.tr, languageCode: 'ar'),
        ],
      ),
    );
  }
}

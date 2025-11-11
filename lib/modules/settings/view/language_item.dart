import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/settings_controller.dart';


class LanguageItem extends GetView<SettingsController> {
  const LanguageItem({
    super.key,
    required this.title,
    required this.languageCode,
  });
  final String title;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text(title),
          trailing: (controller.selectedLanguage == languageCode)
              ? const Icon(Icons.check)
              : const SizedBox(),
          onTap: () {
            controller.updateLanguage(languageCode);
          },
        );
  }
}

import 'package:get/get.dart';

import '../../../../config/translations/localization_service.dart';
import '../../../data/local/app_shared_pref.dart';

class SettingsController extends GetxController {
  String selectedLanguage = AppSharedPreference.getLocal();

  updateLanguage(String languageCode) async {
    await AppSharedPreference.setLocal(languageCode);
    Get.updateLocale(LocalizationService.supportedLanguages[languageCode]!);
    selectedLanguage = AppSharedPreference.getLocal();
    update();
  }
}

import 'package:get/get.dart';

import '../../../data/local/app_shared_pref.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (AppSharedPreference.getOnBoardingState()) {
        Get.offNamed(Routes.base);
      } else {
        Get.offNamed(Routes.onBoarding);
      }
    });
    super.onInit();
  }
}

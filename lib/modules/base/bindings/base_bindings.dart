import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../favorites/controllers/favorite_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../settings/controller/settings_controller.dart';
import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}

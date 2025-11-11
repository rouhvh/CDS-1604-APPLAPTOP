import '../../../utils/dummy_data.dart';
import 'package:get/get.dart';

import '../../../data/model/laptop.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../home/controllers/home_controller.dart';

class DetailsController extends GetxController {
  Laptop laptop = Get.arguments;

  setFavorite() {
    Get.find<HomeController>().setFavorite(laptop.id);
    update(['favorite']);
  }

  addToCart() {
    var item =
        DummyData.laptops.firstWhere((element) => element.id == laptop.id);
    item.quantity = 1;
    Get.find<CartController>().getCartProducts();
    update();
  }
}

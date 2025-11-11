import 'package:get/get.dart';

import '../../../data/model/laptop.dart';
import '../../../../utils/dummy_data.dart';

class FavoriteController extends GetxController {
  List<Laptop> favoriteLaptops = [];

  @override
  void onInit() {
    getfavoriteLaptops();
    super.onInit();
  }

  getfavoriteLaptops() {
    favoriteLaptops = DummyData.laptops
        .where((laptop) => laptop.isFavourite)
        .toList();
    update();
  }
}

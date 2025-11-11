import 'package:get/get.dart';
import '../../../utils/dummy_data.dart';
import '../../../data/model/laptop.dart';
import '../../favorites/controllers/favorite_controller.dart';

class HomeController extends GetxController {
  // 🔹 Biến quan sát (reactive)
  var banners = <String>[].obs;
  var laptops = <Laptop>[].obs;
  var isLoading = false.obs; // ✅ thêm biến này để hiển thị loading

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  // 🔹 Hàm load dữ liệu tổng hợp
  Future<void> loadHomeData() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1)); // mô phỏng load chậm
      getBanners();
      getLaptops();
    } finally {
      isLoading(false);
    }
  }

  void getBanners() {
    banners.assignAll(DummyData.banners);
  }

  void getLaptops() {
    laptops.assignAll(DummyData.laptops);
  }

  void setFavorite(int laptopId) {
    var index = laptops.indexWhere((laptop) => laptop.id == laptopId);
    if (index != -1) {
      laptops[index].isFavourite = !laptops[index].isFavourite;
      laptops.refresh(); // ✅ cập nhật Obx ngay lập tức
      Get.find<FavoriteController>().getfavoriteLaptops();
    }
  }
}

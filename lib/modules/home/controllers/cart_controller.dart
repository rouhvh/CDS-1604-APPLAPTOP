import 'package:get/get.dart';
import '../../../data/model/laptop.dart';
import '../../../../utils/dummy_data.dart';

class CartController extends GetxController {
  List<Laptop> carts = [];

  var total = 0.0;

  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  getCartProducts() {
    carts = DummyData.laptops.where((laptop) => laptop.quantity > 0).toList();
    update();
  }

  onIncrease(int laptopId) {
    var item = carts.firstWhere((laptop) => laptop.id == laptopId);
    item.quantity++;
    update();
  }

  onDecrease(int laptopId) {
    var item = carts.firstWhere((laptop) => laptop.id == laptopId);
    item.quantity--;
    if (item.quantity == 0) {
      carts.remove(item);
    }
    update();
  }

  onDeleteItem(int laptopId) {
    var item = carts.firstWhere((laptop) => laptop.id == laptopId);
    carts.remove(item);
    item.quantity = 0;
    update();
  }

  double calculateTotal() {
    total = 0.0;
    for (var laptop in carts) {
      total += laptop.price * laptop.quantity;
    }
    return total;
  }

  void addToCart(Laptop laptop) {}
}

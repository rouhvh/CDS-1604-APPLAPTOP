import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../data/model/laptop.dart';
import '../../../../utils/dummy_data.dart';

class CartController extends GetxController {
  var carts = <Laptop>[].obs;
  var total = 0.0.obs;

  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  getCartProducts() {
    carts.value = DummyData.laptops.where((laptop) => laptop.quantity > 0).toList();
    update();
  }

  void addToCart(Laptop laptop) {
    var index = carts.indexWhere((item) => item.id == laptop.id);
    if (index != -1) {
      carts[index].quantity++;
    } else {
      carts.add(laptop..quantity = 1);
    }
    update();
  }

  onIncrease(int laptopId) {
    var index = carts.indexWhere((laptop) => laptop.id == laptopId);
    if (index != -1) {
      carts[index] = carts[index].copyWith(quantity: carts[index].quantity + 1);
      update();
    }
  }

  onDecrease(int laptopId) {
    var index = carts.indexWhere((laptop) => laptop.id == laptopId);
    if (index != -1) {
      if (carts[index].quantity > 1) {
        carts[index] = carts[index].copyWith(quantity: carts[index].quantity - 1);
      } else {
        carts.removeAt(index);
      }
      update();
    }
  }

  onDeleteItem(int laptopId) {
    carts.removeWhere((laptop) => laptop.id == laptopId);
    update();
  }

  double calculateTotal() {
    total.value = carts.fold(0.0, (sum, laptop) => sum + laptop.price * laptop.quantity);
    return total.value;
  }

  /// ✅ **Hàm xử lý thanh toán (Gọi API)**
  Future<void> checkout() async {
    var url = Uri.parse("http://192.168.1.79:5000/checkout");

    print("🔹 Gửi yêu cầu thanh toán...");
    print("🔹 API URL: $url");

    var orderData = {
      "items": carts.map((laptop) => {
        "id": laptop.id,
        "name": laptop.name,
        "quantity": laptop.quantity,
        "price": laptop.price
      }).toList(),
      "total": total.value,
    };

    print("🔹 Dữ liệu gửi đi: ${jsonEncode(orderData)}");

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(orderData),
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Thành công", "Thanh toán thành công!");
        carts.clear();
        update();
      } else {
        Get.snackbar("Lỗi", "Thanh toán thất bại! Mã lỗi: ${response.statusCode}");
      }
    } catch (e) {
      print("🔹 Lỗi khi gửi yêu cầu: $e");
      Get.snackbar("Lỗi", "Không thể kết nối đến server: $e");
    }
  }


}

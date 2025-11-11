import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/translations/strings_enum.dart';
import '../controllers/home_controller.dart';
import 'widget/laptop_item.dart';
import '../../cart/controllers/cart_controller.dart';
import 'widget/banner_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Lấy CartController, nếu chưa có thì khởi tạo
    final CartController cartController = Get.put(CartController(), permanent: true);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Laptop Store",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: "Giỏ hàng",
            onPressed: () {
              Get.toNamed('/cart'); // Điều hướng đến trang giỏ hàng
            },
          ),
        ],
      ),

      // ✅ Dùng SafeArea + SingleChildScrollView tránh lỗi overflow
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Banner quảng cáo
              BannerSection(controller: controller),
              const SizedBox(height: 16),

              // 🔹 Tiêu đề
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "🆕 New Laptops",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 🔹 Danh sách sản phẩm
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(() {
                  final laptops = controller.laptops;

                  if (controller.isLoading.value) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (laptops.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text(
                          "No laptops available.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 250,
                    ),
                    itemCount: laptops.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return LaptopItemWidget(laptop: laptops[index]);
                    },
                  );
                }),
              ),

              const SizedBox(height: 24),

              // 🔹 Tổng số sản phẩm trong giỏ
              Center(
                child: Obx(() {
                  final itemCount = cartController.carts.length;
                  return Text(
                    "🛒 Total Items in Cart: $itemCount",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

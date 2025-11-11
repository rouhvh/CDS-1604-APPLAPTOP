import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import 'widget/cart_item.dart';
import '../../../components/custome_btn.dart';
import '../../../components/no_data.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Quay lại trang trước đó (trang chủ)
          },
        ),
      ),
      body: SafeArea(
        child: GetBuilder<CartController>(
          builder: (_) {
            bool isListEmpty = controller.carts.isEmpty;
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Text(
                        Strings.cart.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: ListView.builder(
                          itemCount: controller.carts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CartItem(
                              laptop: controller.carts[index],
                            );
                          }),
                    ),
                    isListEmpty
                        ? NoData(
                            text: Strings.emptyCart.tr,
                            image: 'assets/images/empty_cart.svg')
                        : Column(
                            children: [
                              Text(Strings.total.tr,
                                  style: const TextStyle(fontSize: 20)),
                              const SizedBox(height: 8),
                              Text(
                                '\$ ${controller.calculateTotal().toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: CustomButton(
                                    label: Strings.checkout.tr,
                                    onPressed: () {
                                      Get.snackbar(
                                        Strings.faildSnackbarTitle.tr,
                                        Strings.faildSnackbarMessage.tr,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                        snackStyle: SnackStyle.FLOATING,
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }),
                              )
                            ],
                          ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

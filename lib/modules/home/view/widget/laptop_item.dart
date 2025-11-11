import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/laptop.dart';
import '../../controllers/home_controller.dart';
import '../../../../routes/app_routes.dart';
import 'package:flutter_application_1/modules/cart/controllers/cart_controller.dart';

class LaptopItemWidget extends StatelessWidget {
  const LaptopItemWidget({super.key, required this.laptop});

  final Laptop laptop;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.detail, arguments: laptop);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 0,
                top: 0,
                left: 8,
                child: Image.asset(
                  laptop.image,
                ),
              ),
              Positioned(
                  right: 16,
                  top: 16,
                  child: GetBuilder<HomeController>(
                    id: 'favorite',
                    builder: (controller) => InkWell(
                      onTap: () {
                        controller.setFavorite(laptop.id);
                      },
                      child: laptop.isFavourite
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  )),
              Positioned(
                right: 16,
                bottom: 16,
                child: InkWell(
                  onTap: () {
                    cartController.addToCart(laptop);
                    Get.snackbar(
                      "Add to cart",
                      "${laptop.name} added!",
                      mainButton: TextButton(
                        onPressed: () {
                          Get.toNamed('/cart');
                        },
                        child: const Text("View cart"),
                      ),
                    );
                  },
                  child: const Icon(Icons.add_shopping_cart, color: Colors.black),
                ),
              ),
            ]),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                laptop.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                textDirection: (Get.locale?.countryCode == 'ar')
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

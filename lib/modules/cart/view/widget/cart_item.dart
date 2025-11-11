import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/laptop.dart';
import '../../controllers/cart_controller.dart';
import '../../../../routes/app_routes.dart';

class CartItem extends GetView<CartController> {
  const CartItem({super.key, required this.laptop});

  final Laptop laptop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
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
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.detail, arguments: laptop);
                    },
                    child: Image.asset(
                      laptop.image,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  laptop.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${laptop.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 14),
                GetBuilder<CartController>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => controller.onIncrease(laptop.id),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                        '${laptop.quantity}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 18),
                      InkWell(
                        onTap: () => controller.onDecrease(laptop.id),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12,
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => controller.onDeleteItem(laptop.id),
                child: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

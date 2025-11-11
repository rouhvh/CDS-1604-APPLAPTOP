import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/laptop.dart';
import '../../../../routes/app_routes.dart';
import '../../../home/controllers/home_controller.dart';
import '../../controllers/favorite_controller.dart';

class FavouriteItem extends GetView<FavoriteController> {
  const FavouriteItem({super.key, required this.laptop});

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
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  laptop.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$${laptop.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Positioned(
              right: 16,
              top: 16,
              child: GetBuilder<HomeController>(
                id: 'favorite',
                builder: (controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
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
                ),
              )),
        ]),
      ),
    );
  }
}

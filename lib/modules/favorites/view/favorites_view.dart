import 'package:flutter/material.dart';
import '../../../config/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../components/no_data.dart';
import '../controllers/favorite_controller.dart';
import 'widget/favourite_item.dart';

class FavoritesView extends GetView<FavoriteController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (_) {
        bool isListEmpty = controller.favoriteLaptops.isEmpty;
        return Scaffold(
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Text(
                      Strings.favorites.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                  const SizedBox(height: 16),
                  isListEmpty
                      ? NoData(
                          text: Strings.noFavorites.tr,
                            image: 'assets/images/favourite_item.png')
            : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: ListView.builder(
                              itemCount: controller.favoriteLaptops.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                return FavouriteItem(
                                  laptop: controller.favoriteLaptops[index],
                                );
                              }),
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

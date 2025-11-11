import 'package:flutter/material.dart';
import '../../../config/translations/strings_enum.dart';
import 'package:get/get.dart';

import '../../../components/custome_btn.dart';
import '../../../data/local/app_shared_pref.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 40,
                  left: 8,
                  child: Image.asset(
                    controller.laptop.image,
                  ),
                ),
                Positioned(
                    right: 16,
                    top: 16,
                    child: GetBuilder<DetailsController>(
                      id: 'favorite',
                      builder: (controller) => InkWell(
                        onTap: () {
                          controller.setFavorite();
                        },
                        child: controller.laptop.isFavourite
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
                    left: 16,
                    top: 16,
                    child: InkWell(
                        onTap: () => Get.back(),
                        child: (AppSharedPreference.getLocal() == 'en')
                            ? const Icon(Icons.arrow_back)
                            : const Icon(Icons.arrow_forward))),
              ]),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  controller.laptop.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      '${controller.laptop.price} \$',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Icon(Icons.star_rounded, color: Colors.amber),
                    Text(controller.laptop.rating.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  label: Strings.addToCart.tr,
                  onPressed: () {
                    controller.addToCart();
                    Get.snackbar(
                      Strings.successSnackbarTitle.tr,
                      '${controller.laptop.name} ${Strings.successSnackbarMessage.tr}',
                      backgroundColor: Colors.black87,
                      colorText: Colors.white,
                      snackStyle: SnackStyle.FLOATING,
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

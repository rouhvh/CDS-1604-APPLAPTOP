import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custome_btn.dart';
import '../../../../data/local/app_shared_pref.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/on_boarding_controller.dart';
import '../model/on_boarding_item.dart';

class OnBoaringWidget extends GetView<OnBoardingController> {
  const OnBoaringWidget({Key? key, required this.item}) : super(key: key);

  final OnBoardingItem item;
  @override
  Widget build(BuildContext context) {
    final int lastIndex = controller.onBoardingList.length - 1;
    final bool showGetStartedButton = lastIndex == controller.pageIndex;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          item.image,
          height: 300,
        ),
        const SizedBox(height: 24),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            item.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        showGetStartedButton
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  onPressed: () async {
                    await AppSharedPreference.setOnBoardingState(true);
                    Get.offAllNamed(Routes.base);
                  },
                  label: Strings.start.tr,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

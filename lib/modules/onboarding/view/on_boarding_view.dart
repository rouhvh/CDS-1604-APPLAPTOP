import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/translations/strings_enum.dart';
import '../controller/on_boarding_controller.dart';
import 'widget/custome_boarding_item.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return GetBuilder<OnBoardingController>(
      builder: (_) => Scaffold(
        body: PageView.builder(
          controller: pageController,
          onPageChanged: controller.updatePageIndex,
          itemCount: controller.onBoardingList.length,
          itemBuilder: (context, index) {
            return OnBoaringWidget(
              item: controller.onBoardingList[index],
            );
          },
        ),
        bottomSheet: OnBoardingBottomSheet(
          controller: controller,
          pageController: pageController,
        ),
      ),
    );
  }
}

class OnBoardingBottomSheet extends StatelessWidget {
  const OnBoardingBottomSheet({
    super.key,
    required this.controller,
    required this.pageController,
  });

  final OnBoardingController controller;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final bool showButtons =
        controller.pageIndex != controller.onBoardingList.length - 1;

    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showButtons
              ? TextButton(
                  onPressed: () => pageController.jumpToPage(2),
                  child: Text(
                    Strings.skip.tr,
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              : const SizedBox(),
          SmoothPageIndicator(
            controller: pageController,
            count: controller.onBoardingList.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.grey,
              activeDotColor: Colors.black,
            ),
          ),
          showButtons
              ? TextButton(
                  onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                  child: Text(
                    Strings.next.tr,
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

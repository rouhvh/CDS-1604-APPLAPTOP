import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../controllers/home_controller.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: CarouselSlider.builder(
        itemCount: controller.banners.length,
        itemBuilder: (context, index, realIndex) => ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            controller.banners[index],
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        options: CarouselOptions(
          viewportFraction: 0.85,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOutCubic,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
      ),
    );
  }
}

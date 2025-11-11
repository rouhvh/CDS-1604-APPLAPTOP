import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../home/view/home_view.dart';
import '../../favorites/view/favorites_view.dart';
import '../../cart/view/cart_view.dart';
import '../../profile/view/profile_view.dart';

class BaseController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    FavoritesView(),
    CartView(),
    ProfileView(), // ✅ ĐÃ BỎ const
  ];

  void changePage(int index) {
    if (index < 0 || index >= pages.length) return;
    currentIndex.value = index;
  }
}

import 'package:get/get.dart';

import 'app_routes.dart';

import '../modules/base/bindings/base_bindings.dart';
import '../modules/base/view/base_view.dart';
import '../modules/cart/bindings/cart_bindings.dart';
import '../modules/cart/view/cart_view.dart';
import '../modules/details/bindings/details_bindings.dart';
import '../modules/details/view/details_view.dart';
import '../modules/favorites/bindings/favorite_bindings.dart';
import '../modules/favorites/view/favorites_view.dart';
import '../modules/home/view/home_view.dart';
import '../modules/onboarding/bindings/on_boarding_binding.dart';
import '../modules/onboarding/view/on_boarding_view.dart';
import '../modules/settings/bindings/settings_bindings.dart';
import '../modules/settings/view/settings_view.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/view/splash_view.dart';

// 👇 IMPORT THÊM 2 MÀN HÌNH AUTHENTICATION
import '../widgets/auth/login_screen.dart';
import '../widgets/auth/register_screen.dart';

class AppPages {
  AppPages._();

  // Màn hình khởi đầu
  static const String initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onBoarding,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.base,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: Routes.favorites,
      page: () => const FavoritesView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),

    // 👇 THÊM ROUTE CHO LOGIN
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      // Nếu sau này bạn có controller riêng thì thêm LoginBinding() tại đây
    ),

    // 👇 THÊM ROUTE CHO REGISTER
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      // Nếu có controller riêng thì thêm RegisterBinding()
    ),
  ];
}

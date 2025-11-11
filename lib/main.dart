import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import 'config/translations/localization_service.dart';
import 'data/local/app_shared_pref.dart';

// Controllers
import 'modules/base/controllers/base_controller.dart';
import 'modules/home/controllers/home_controller.dart';
import 'modules/favorites/controllers/favorite_controller.dart';
import 'modules/cart/controllers/cart_controller.dart';
import 'modules/profile/controllers/profile_controller.dart';

// Views
import 'modules/base/view/base_view.dart';
import 'widgets/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Khởi tạo Shared Preferences
  await AppSharedPreference.init();

  // ✅ Khởi tạo tất cả controller cần thiết
  Get.put(BaseController());
  Get.put(HomeController());
  Get.put(FavoriteController());
  Get.put(CartController());
  Get.put(ProfileController());

  // ✅ Chạy app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laptop Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // ✅ Ngôn ngữ
      translations: LocalizationService.getInstance(),
      locale: LocalizationService.getCurrentLocal(),

      // ✅ Giao diện ban đầu
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // ⏳ Đang chờ kết nối Firebase
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ Lỗi xác thực Firebase
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Authentication error:\n${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        // 👤 Kiểm tra trạng thái người dùng
        final user = snapshot.data;

        if (user != null) {
          // ✅ Đã đăng nhập → vào trang chính
          return const BaseView();
        } else {
          // 🔐 Chưa đăng nhập → màn hình đăng nhập
          return const LoginScreen();
        }
      },
    );
  }
}

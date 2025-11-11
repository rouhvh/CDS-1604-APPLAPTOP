import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../config/translations/strings_enum.dart';
import '../controllers/base_controller.dart';
import 'package:flutter_application_1/widgets/auth/login_screen.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final User? _user = FirebaseAuth.instance.currentUser;

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {}
    Get.offAll(() => const LoginScreen());
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Tiếng Việt'),
              onTap: () {
                Get.updateLocale(const Locale('vi'));
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              onTap: () {
                Get.updateLocale(const Locale('en'));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerHeader() {
    final name = _user?.displayName ?? "Người dùng";
    final email = _user?.email ?? "";

    return UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(email),
      currentAccountPicture: CircleAvatar(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : "U",
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }

  Widget _drawerMenu() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _drawerHeader(),
        ListTile(
          leading: const Icon(Icons.dashboard_outlined),
          title: const Text("Dashboard"),
          onTap: () => Get.toNamed("/dashboard"),
        ),
        ListTile(
          leading: const Icon(Icons.insights_outlined),
          title: const Text("Tổng quan"),
          onTap: () => Get.toNamed("/overview"),
        ),
        ListTile(
          leading: const Icon(Icons.pie_chart_outline),
          title: const Text("Thống kê"),
          onTap: () => Get.toNamed("/stats"),
        ),
        ListTile(
          leading: const Icon(Icons.report_outlined),
          title: const Text("Báo cáo"),
          onTap: () => Get.toNamed("/reports"),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Chung"),
          onTap: () => Get.toNamed("/settings/general"),
        ),
        ListTile(
          leading: const Icon(Icons.system_update_alt),
          title: const Text("Hệ thống"),
          onTap: () => Get.toNamed("/settings/system"),
        ),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text("Bảo mật"),
          onTap: () => Get.toNamed("/settings/security"),
        ),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text("Thông báo"),
          onTap: () => Get.toNamed("/settings/notifications"),
        ),
        ListTile(
          leading: const Icon(Icons.translate),
          title: const Text("Ngôn ngữ"),
          onTap: _showLanguagePicker,
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Đăng xuất"),
          onTap: _logout,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BaseController controller = Get.find<BaseController>();
    final pages = controller.pages;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Laptop Store"),
        ),

        drawer: Drawer(child: _drawerMenu()),

        // ✅ Chỉ hiển thị page, KHÔNG hiển thị avatar + quick action nữa
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: Strings.home.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: Strings.favorites.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: Strings.cart.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.person), label: Strings.profile.tr),
          ],
        ),
      ),
    );
  }
}

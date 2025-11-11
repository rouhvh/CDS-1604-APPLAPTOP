import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final name = user?.displayName ?? "Người dùng";
    final email = user?.email ?? "no-email@example.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(name, email),

          const SizedBox(height: 20),

          // =============== HOẠT ĐỘNG CỦA TÔI ===============
          _sectionTitle("Hoạt động của tôi"),
          _menuItem(Icons.shopping_bag_outlined, "Đơn hàng", () {
            Get.toNamed("/orders");
          }),
          _menuItem(Icons.favorite_border, "Yêu thích", () {
            Get.toNamed("/favorites");
          }),
          _menuItem(Icons.shopping_cart_outlined, "Giỏ hàng", () {
            Get.toNamed("/cart");
          }),
          _menuItem(Icons.location_on_outlined, "Địa chỉ", () {
            Get.toNamed("/address");
          }),
          _menuItem(Icons.payment, "Phương thức thanh toán", () {
            Get.toNamed("/payment-methods");
          }),

          const SizedBox(height: 20),

          // =============== CÀI ĐẶT ===============
          _sectionTitle("Cài đặt"),
          _menuItem(Icons.language, "Ngôn ngữ", () {
            _showLanguagePicker();
          }),
          _menuItem(Icons.dark_mode_outlined, "Chế độ tối", () {
            Get.changeThemeMode(ThemeMode.dark);
          }),
          _menuItem(Icons.light_mode_outlined, "Chế độ sáng", () {
            Get.changeThemeMode(ThemeMode.light);
          }),

          const SizedBox(height: 20),

          // =============== ĐĂNG XUẤT ===============
          _sectionTitle("Tài khoản"),
          _menuItem(Icons.logout, "Đăng xuất", () async {
            await FirebaseAuth.instance.signOut();
            Get.offAllNamed('/login'); // 🔥 quay về login
          }),
        ],
      ),
    );
  }

  // ========================================================
  // HEADER PROFILE
  // ========================================================
  Widget _buildHeader(String name, String email) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      color: Colors.deepPurple.shade50,
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.deepPurple.shade100,
            child: Text(
              name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ========================================================
  // TITLE FOR EACH SECTION
  // ========================================================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  // ========================================================
  // LIST MENU ITEM
  // ========================================================
  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // ========================================================
  // LANGUAGE PICKER
  // ========================================================
  void _showLanguagePicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Chọn ngôn ngữ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            ListTile(
              title: const Text("Tiếng Việt"),
              onTap: () {
                Get.updateLocale(const Locale('vi'));
                Get.back();
              },
            ),
            ListTile(
              title: const Text("English"),
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
}

import 'package:get/get.dart';

class ProfileController extends GetxController {
  // 🧭 Dữ liệu người dùng (demo)
  var username = 'Guest'.obs;
  var email = 'guest@example.com'.obs;

  // 🧩 Hàm cập nhật thông tin
  void updateProfile(String newName, String newEmail) {
    username.value = newName;
    email.value = newEmail;
  }
}

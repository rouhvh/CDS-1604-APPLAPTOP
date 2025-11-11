
import 'package:shared_preferences/shared_preferences.dart';


class AppSharedPreference {
  AppSharedPreference._();

  static const String local = 'Local';
  static const String onBoarding = 'onBoarding';

  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setLocal(String value) async {
    await prefs.setString(local, value);
  }

  static String getLocal() {
    return prefs.getString(local) ?? 'en';
  }

  static Future<void> setOnBoardingState(bool value) async {
    await prefs.setBool(onBoarding, value);
  }

  static bool getOnBoardingState() {
    return prefs.getBool(onBoarding) ?? false;
  }
}
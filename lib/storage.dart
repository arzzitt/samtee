import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? sharedPreferences;
  // static const _isLoggedIn="isLoggedIn";
  static const _token = "token";
  static const _homeCategId = "homeCategId";

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // static Future set_isLoggedIn(bool isLoggedIn)async=>await sharedPreferences!.setBool(_isLoggedIn, isLoggedIn);
  // static bool? get_isLoggedIn()=>sharedPreferences!.getBool(_isLoggedIn)??false;

  static Future set_token(String token) async =>
      await sharedPreferences?.setString(_token, token);
  static String get_token() => sharedPreferences?.getString(_token) ?? "";

  static Future set_categoryIdHome(String homeCategId) async =>
      await sharedPreferences?.setString(_homeCategId, homeCategId);
  static String get_categoryIdHome() =>
      sharedPreferences?.getString(_homeCategId) ?? "";
}

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? sharedPreferences;
  static const _isLoggedIn = "isLoggedIn";
  static const _isFirst = "isLoggedIn";
  static const _token = "token";
  static const _homeCategId = "homeCategId";
  static const _categTotal = "categoryTotal";
  static const _noncetoken = "Nonce";
  static const _custid = "id";
  static const _custname = "name";

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future logout()async{
    await sharedPreferences!.clear();
  }

  static Future set_isLoggedIn(bool isLoggedIn) async =>
      await sharedPreferences?.setBool(_isLoggedIn, isLoggedIn);
  static bool? get_isLoggedIn() =>
      sharedPreferences!.getBool(_isLoggedIn)??false;

  static Future set_isFirst(bool isFirst) async =>
      await sharedPreferences?.setBool(_isFirst, isFirst);
  static bool? get_isFirst() =>
      sharedPreferences!.getBool(_isFirst)??true;

  static Future set_token(String token) async =>
      await sharedPreferences?.setString(_token, token);
  static String get_token() => sharedPreferences?.getString(_token) ?? "";

  static Future set_categoryIdHome(String homeCategId) async =>
      await sharedPreferences?.setString(_homeCategId, homeCategId);
  static String get_categoryIdHome() =>
      sharedPreferences?.getString(_homeCategId) ?? "";

  static Future set_categoryTotal(String categoryTotal) async =>
      await sharedPreferences?.setString(_categTotal, categoryTotal);
  static String get_categoryTotal() =>
      sharedPreferences?.getString(_categTotal) ?? "";

  static Future set_noncetoken(String noncetoken) async =>
      await sharedPreferences?.setString(_noncetoken, noncetoken);
  static String get_noncetoken() =>
      sharedPreferences?.getString(_noncetoken) ?? "";

  static Future set_custid(String custid) async =>
      await sharedPreferences?.setString(_custid, custid);
  static String get_custid() => sharedPreferences?.getString(_custid) ?? "";
  static Future set_custname(String custname) async =>
      await sharedPreferences?.setString(_custname, custname);
  static String get_custname() => sharedPreferences?.getString(_custname) ?? "";
}

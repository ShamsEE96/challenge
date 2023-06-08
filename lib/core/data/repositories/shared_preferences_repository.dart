import 'dart:convert';

import 'package:big_winner_yay/core/enums/data_type.dart';
import 'package:big_winner_yay/main.dart';

class SharedPreferencesRepository {
  //!--- Keys ----
  // static String PREF_FIRST_LAUNCH = 'first_launch';
  // static String PREF_TOKEN = 'token';
  // // static String PREF_ISLOGGED = 'is_logged';

  // static void setFirstLaunch(bool value) {
  //   setPreference(
  //     dataType: DataType.BOOL,
  //     key: PREF_FIRST_LAUNCH,
  //     value: value,
  //   );
  // }

  // static bool getFirstLaunch() {
  //   if (globalSharedPreferences.containsKey(PREF_FIRST_LAUNCH)) {
  //     return getPreference(key: PREF_FIRST_LAUNCH);
  //   } else {
  //     return true;
  //   }
  // }

  // static void setTokenInfo(TokenInfoModel value) {
  //   setPreference(
  //     dataType: DataType.STRING,
  //     key: PREF_TOKEN,
  //     value: jsonEncode(value.toJson()),
  //   );
  // }

  // static TokenInfoModel? getTokenInfo() {
  //   if (globalSharedPreferences.containsKey(PREF_TOKEN)) {
  //     return TokenInfoModel.fromJson(
  //         jsonDecode(getPreference(key: PREF_TOKEN)));
  //   } else {
  //     return null;
  //   }
  // }

  // static void clearTokenInfo() {
  //   // globalSharedPreferences.remove(PREF_TOKEN);
  //   globalSharedPreferences.clear();
  // }

  // static bool get isLoggedIn => getTokenInfo() != null ? true : false;

  // static void setFirstLogin(bool value) {
  //   setPreference(
  //     dataType: DataType.BOOL,
  //     key: PREF_ISLOGGED,
  //     value: value,
  //   );
  // }

  // static bool getFirstLogin() {
  //   if (globalSharedPreferences.containsKey(PREF_ISLOGGED)) {
  //     return getPreference(key: PREF_ISLOGGED);
  //   } else {
  //     return true;
  //   }
  // }

  //!--- Main Function ----
  static setPreference({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  static getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
}

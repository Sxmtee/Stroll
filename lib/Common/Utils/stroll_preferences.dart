import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userNameProvider = StateProvider<String>((ref) => '');
final accessTokenProvider = StateProvider<String>((ref) => '');

class StrollPreferences {
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //! Setting the preferences
  static Future setNickname(String nickname, WidgetRef ref) async {
    await _preferences.setString("nickName", nickname);
    ref.read(userNameProvider.notifier).state = nickname;
  }

  //! Getting the preferences
  static String? getNickname() => _preferences.getString('nickName') ?? '';

  //! Clearing the preferences
  static clear() => _preferences.clear();
}

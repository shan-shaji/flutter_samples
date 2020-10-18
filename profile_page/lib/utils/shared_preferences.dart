

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  void storeString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(key);
    prefs.setString(key, value);
  }

 Future<String> readString(String key) async {
    String readedString;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    readedString = prefs.getString(key);
    return readedString;
  }
}

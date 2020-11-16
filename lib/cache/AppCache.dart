
import 'package:shared_preferences/shared_preferences.dart';

class AppCache{
  static final AppCache _instance = AppCache();

  static AppCache get instance{
    return _instance;
  }

  SharedPreferences prefs;

  static const String KEY_USER="User";
  static const String KEY_TOKEN = "token";
  static const String KEY_TYPE = "type";

  Future<void> init () async{
    prefs= await SharedPreferences.getInstance();

  }
}
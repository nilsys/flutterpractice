
import 'package:shared_preferences/shared_preferences.dart';

class AppCache{
  static final AppCache _instance = AppCache();

  static AppCache get instance{
    return _instance;
  }

  SharedPreferences prefs;

  static const String KEY_EXIST="Exist";
  static const String KEY_USER="User";
  static const String KEY_TOKEN = "token";
  static const String KEY_TYPE = "type";
  static const String KEY_NAME = "Name";
  static const String KEY_PROFILE_IMAGE = "IMAGE";
  static const String KEY_PHONE_NUMBER = "PHONE";
  static const String KEY_LOCATION = "LOCATION";
  static const String KEY_Email = "Email";

  Future<void> init () async{
    prefs= await SharedPreferences.getInstance();
  }

}
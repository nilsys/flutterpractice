

import 'AppCache.dart';

class UserCache {

  static final UserCache _instance= UserCache();

  static UserCache get instance{
    return _instance;
  }

  void setUserCache(bool isUser){
    if (isUser == null) return ;
    AppCache.instance.prefs.setBool(AppCache.KEY_USER, isUser);
  }

  bool getUserCache(){
    bool isUser= AppCache.instance.prefs.get(AppCache.KEY_USER);
    return isUser;
  }


  void setUserType(String type){
    if (type == null) return ;
    AppCache.instance.prefs.setString(AppCache.KEY_TYPE, type);
  }

  String getUserType(){

    String type = AppCache.instance.prefs.getString(AppCache.KEY_TYPE);
    return type;
  }


  void setUserName(String name){
    if (name == null) return ;
    AppCache.instance.prefs.setString(AppCache.KEY_NAME, name);
  }

  String getUserName() {
    String name = AppCache.instance.prefs.getString(AppCache.KEY_NAME);
    return name ;
  }

  void setUserEmail(String email){
    if (email == null) return ;
    AppCache.instance.prefs.setString(AppCache.KEY_Email, email);
  }

  String getUserEmail() {
    String email = AppCache.instance.prefs.getString(AppCache.KEY_Email);
    return email ;
  }


  void setUserPhone(String phone){
    if (phone == null) return ;
    AppCache.instance.prefs.setString(AppCache.KEY_PHONE_NUMBER, phone);
  }

  String getUserPhone() {
    String phone = AppCache.instance.prefs.getString(AppCache.KEY_PHONE_NUMBER);
    return phone;
  }


  void setUserImage(String image){
    if (image == null) return ;
    AppCache.instance.prefs.setString(AppCache.KEY_PROFILE_IMAGE, image);
  }

  String getUserImage() {
    String image = AppCache.instance.prefs.getString(AppCache.KEY_PROFILE_IMAGE);
    return image;
  }

}


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


}
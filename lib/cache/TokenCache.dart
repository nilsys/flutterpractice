

import 'package:flutterpractice/cache/AppCache.dart';

class TokenCache{

  static final TokenCache _instance= TokenCache();

  static TokenCache get instance{
    return _instance;
  }

  void setAccessToken(String token){
    if (token==null) return ;
    print('SetAccessToken'+token);
    AppCache.instance.prefs.setString(AppCache.KEY_TOKEN, token);
  }

  String getAccessToken(){
    String token= AppCache.instance.prefs.get(AppCache.KEY_TOKEN);
    return token;
  }

}
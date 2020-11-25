

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterpractice/Model/login/UserResponse.dart' as eos;

import 'AppCache.dart';

class UserCache {

  static final UserCache _instance= UserCache();

  static UserCache get instance{
    return _instance;
  }

  void setUserCache(bool isUser){
    if (isUser == null) return ;
    AppCache.instance.prefs.setBool(AppCache.KEY_EXIST, isUser);
  }

  bool getUserCache(){
    bool isUser= AppCache.instance.prefs.get(AppCache.KEY_EXIST);
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
  void setUserlocation(String location){
    if (location == null) return ;
    AppCache.instance.prefs.setString(AppCache.KEY_LOCATION, location);
  }
  String getUserLocation(){
    String location = AppCache.instance.prefs.getString(AppCache.KEY_LOCATION);
    return location;
  }
  void setUser(eos.UserResponse model){
    if (model ==null) return;
    String json =jsonEncode(model.toJson());
    AppCache.instance.prefs.setString(AppCache.KEY_USER, json);
  }
  eos.UserResponse getUser(){
    String json = AppCache.instance.prefs.getString(AppCache.KEY_USER);
    return json == null ? null : eos.UserResponse.fromJson(jsonDecode(json));
  }
}
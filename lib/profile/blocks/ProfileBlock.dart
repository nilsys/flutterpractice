

import 'dart:async';

import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:flutterpractice/profile/model/ProfileModel.dart';
import 'package:rxdart/rxdart.dart';

class Profilebloc{
  // final _profilefetcher = PublishSubject<ProfileModel>();
  StreamController<ProfileModel> userController = StreamController();
  // Observable<ProfileModel> get userControllerer=>  _profilefetcher.stream;


  fetchUserData() {
    var name = UserCache.instance.getUserName();
    var email = UserCache.instance.getUserEmail();
    var phone = UserCache.instance.getUserPhone();
    var locationName = UserCache.instance.getUserLocation();
    var image = UserCache.instance.getUserImage();
    userController.add(ProfileModel(name, email, phone, locationName,image));
  }

  dispose() {
    userController.close();
  }
}
import 'dart:async';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/cache/UserCache.dart';

class Profilebloc{
  StreamController<User> userController = StreamController();

   void  fetchUserData() {
    var user = UserCache.instance.getUser();
    userController.add(user.user);
  }
  dispose() { userController.close(); }
}
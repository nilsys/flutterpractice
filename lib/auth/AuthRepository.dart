
import 'file:///C:/Users/intcore-013/AndroidStudioProjects/flutterpractice/lib/Model/register/RegisterResponse.dart';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/Model/register/RegisterResponse.dart';
import 'file:///C:/Users/intcore-013/AndroidStudioProjects/flutterpractice/lib/Model/login/SignInSocial.dart';
import 'package:flutterpractice/network/Network.dart';

class AuthRepository{

  Network network;

  AuthRepository() {
    network = Network();
  }

  Future<UserResponse> signUp(String endpoint,Map<String,String> body) async {
    var jsonData = await network.post(endpoint, body);
    UserResponse userResponse = await UserResponse.fromJson(jsonData);
      return userResponse;
    // }else {
    //   RegisterErrorResponse errorResponse = await RegisterErrorResponse.fromJson(jsonData);
    //   print("nnnnnn"+errorResponse.errors.name.toString());
    //   print(errorResponse.errors.email);
    //   print(errorResponse.errors.password);
    //   return errorResponse;
    // }
  }


  Future<SignInSocial> signInSocial(String endpoint,Map<String,String> body) async {
    var jsonData = await network.post(endpoint, body);
    SignInSocial userResponse = await SignInSocial.fromJson(jsonData);
    print(userResponse.user.name);
    print(userResponse.user.type);
    return userResponse;
}

  Future<UserResponse> registerSocial(String endpoint,Map<String,String> body) async {
    var jsonData = await network.post(endpoint, body);
    UserResponse userResponse = await UserResponse.fromJson(jsonData);
    print("register Social"+userResponse.user.name);
    print("register Social"+userResponse.user.type);
    return userResponse;
  }
}
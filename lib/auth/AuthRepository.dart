import 'package:flutterpractice/Model/login/SignInSocial.dart';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/Model/logout/Logout.dart';
import 'package:flutterpractice/network/Network.dart';

class AuthRepository{

  Network network;

  AuthRepository() {
    network = Network();
  }

  Future<UserResponse> signUp(String endpoint,Map<String,String> headers,Map<String,String> body) async {
    var jsonData = await network.post(endpoint , headers , body);
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


  Future<UserResponse> signInSocial(String endpoint,Map<String,String> headers,Map<String,String> body) async {
    var jsonData = await network.post(endpoint, headers ,body);
    UserResponse userResponse = await UserResponse.fromJson(jsonData);
    print("aaaaaa"+userResponse.user.name);
    print("aaaaaa"+userResponse.user.id.toString());
    return userResponse;
}

  Future<UserResponse> registerSocial(String endpoint,Map<String,String> headers,Map<String,String> body) async {
    var jsonData = await network.post(endpoint , headers , body);
    UserResponse userResponse = await UserResponse.fromJson(jsonData);
    print("register Social"+userResponse.user.name);
    print("register Social"+userResponse.user.type);
    return userResponse;
  }

  Future<Logout> logout(String endpoint,Map<String,String> headers ) async {
    var jsonData = await network.post(endpoint , headers , null);
   // print("jjjjj"+jsonData);
    Logout logout = await Logout.fromJson(jsonData);
    print("Logout"+logout.message.toString());
    return logout;
  }
}
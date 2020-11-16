
import 'package:flutterpractice/Model/RegisterResponse.dart';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/network/Network.dart';

class AuthRepository{

  String url = "https://aerbag-dev.intcore.net/api/";
  Network network;

  AuthRepository() {
    network = Network();
  }

  Future<UserResponse> signUp(String endpoint,Map<String,String> body) async {
    var jsonData = await network.post(endpoint, body);
    print("ooooo"+jsonData.toString());
    UserResponse userResponse = await UserResponse.fromJson(jsonData);
    print(userResponse.user.name);
    print(userResponse.user.type);
    return userResponse;
  }
}
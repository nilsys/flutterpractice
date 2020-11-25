import 'dart:convert';
import 'dart:io';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:http/http.dart' as http;

class Network {
 String urlAer= "https://aerbag-dev.intcore.net/api";

  Future<UserResponse> login(String email,String password) async {
    var url ="$urlAer/login";
    var response = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept':'application/json'
    },
      body: jsonEncode(<String, String>{
      'email': email,
       'password' : password
    }),
    );
    // print(response.body);

    var jsondata=json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      UserResponse loginResponse = UserResponse.fromJson(jsondata);
      print('success ${loginResponse.user.name}');
      return loginResponse;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      int statusCode = HttpStatus.ok;
      print("Error is ${response.body}");
      var errorData=json.decode(response.body);

     // ErrorLoginResponse errorLoginResponse =  ErrorLoginResponse.fromJson(errorData);
     // print(errorLoginResponse.message);
    }
  }
  Future<dynamic> get(String endPoint) async {
    var url = urlAer + "/" + endPoint;
    var response = await http.get(url, headers: updateHeaders());
    if (response.statusCode == 200) {
      print("Get success");
      return json.decode(response.body);
    } else {
      int statusCode = HttpStatus.ok;
      print(statusCode);
    }
  }

  Future<dynamic> post(String endPoint,Map<String, String> headers,Map<String, String> body) async{
    var url = urlAer+"/"+ endPoint;
    http.Response response = await http.post(url, headers: headers , body: jsonEncode(body));
    if (response.statusCode==200){
      print("Post success");
      return json.decode(response.body);
  } else {
      print(response.body);
      print("Error"+response.statusCode.toString());
      return response.body;
  }}

  Map<String,String> updateHeaders() {
  var token = TokenCache.instance.getAccessToken();
    return {
      'Content-Type': 'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer $token',
      'X-localization':'en'
    };
  }


 Map<String,String> postHeaders() {
   return {
      'Accept':'application/json',
     'Content-Type': 'application/json',
   };
 }
}


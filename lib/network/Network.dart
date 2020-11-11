import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterpractice/Model/HomeResponse.dart';
import 'package:flutterpractice/Model/login/ErrorLoginResponse.dart';
import 'package:flutterpractice/Model/login/LoginResponse.dart';
import 'package:flutterpractice/ui/Home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
 String urlAer= "https://aerbag-dev.intcore.net/api/";
/*
  Future<List<Data>> getNearBy() async {
    try {
      String url = "https://aerbag-dev.intcore.net/api/users/categories/1/lat/37.33233141/long/-122.0312186?page=1";
      String authorization = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1YmU0NGM3ODI1YzNlNTMyMGUxNWNhY2ZlZDE1ZDFiNGU4YTNmYjdhNmUwN2VlYzhiYmYzODkyMjU0OGQ1OGJlN2UyNGZhZGMzYTg4YTYyIn0.eyJhdWQiOiIxIiwianRpIjoiOTViZTQ0Yzc4MjVjM2U1MzIwZTE1Y2FjZmVkMTVkMWI0ZThhM2ZiN2E2ZTA3ZWVjOGJiZjM4OTIyNTQ4ZDU4YmU3ZTI0ZmFkYzNhODhhNjIiLCJpYXQiOjE2MDQ1NjY4MDcsIm5iZiI6MTYwNDU2NjgwNywiZXhwIjoxNjM2MTAyODA3LCJzdWIiOiI3NSIsInNjb3BlcyI6W119.gTE8orOX3CPy-7IkVRYnH0hGps2jh3uFaMDFQA4W0thvpmVH0J7dPIPKLUF4cg2vwtXmTZaOVuvg7U5wNdF69AtJJpI2bk_Hq3ZCRLH9-u67RtIacsiPK5wUyjsMs-j6fb18GyrUy2rw_yvrsnuPuxacaHD0YJvk9PhwiAnho4Fooks8yZDZwG_i5xcCAjCFif3V3hV6Q20kgJ4fmmJiFKmmPQgJAHpGvzFJ-lmh0yyF32s9inSagJLSs4Xf9L1SquEb_ucgJnggUkJ3E_5yr_dGqtNbHsQKiMLKEku9CVM1MuZC9asmQm4w_ODfhhU-OjPno5kA0MO4YFYuxG4bJG5JDbiGcQcJ52OEdUmShOW-wVVXOlUU8GNInbywZSu5mXFmFJLEqUVYnvjp5G0CioqBCoSoOIUj7ZbY37gtDj3Un6UFtq86YKIewMSCq0c_q5s-ZzibkGnkUYK5s8j8oBOa9LtTdoYH7hxIxp2V4cDKU7unQ0iRJPcAZfpoIyGYWauTjgG46NQNE2tA14we2RVAuL_tV1RlBwATJ5JM5ezauY5MhTMH8tO_bOcbkELgal2XH2Gp74AmilhhvjTgzzwgz4gOdOBr8wglNOkfccc8xc_vCWCIwvsuzvFIj2Mpw4QyhS0pto7qJi4So_hYAw6jf6FgQBWp_Xdgs4MRoIU';
      Dio dio = new Dio();
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['authorization'] = authorization;

      Response response = await dio.get(url);
      //   print(response);
      var jsondata = json.decode(response.data);
      HomeResponse homeResponse = HomeResponse.fromJson(jsondata);
      if (response.statusCode == 200) {
        print(" ssssss ${jsondata.toString()}");
        print("dddddd  ${homeResponse.data.length}");

        return homeResponse.data;

      }

    } catch (e) {
      print(e);
    }
  }
*/

  String token;
  Network(){
    print("rrrrr");
    getToken().then((value) {
      token = value ;
    }
    );
  }


  Future<List<Data>> getNearBy(String token) async {
    var url ="https://aerbag-dev.intcore.net/api/users/categories/1/lat/37.33233141/long/-122.0312186?page=1";
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer $token',
      'X-localization':'en'
    },);

    var jsondata=json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      HomeResponse homeResponse=HomeResponse.fromJson(jsondata);
      print('success ${homeResponse.data[0].email}');
      return homeResponse.data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      int statusCode = HttpStatus.ok;
      print(statusCode);
      throw Exception('Error getting near by');
    }
  }




  Future<LoginResponse> login(String email,String password) async {
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

      LoginResponse loginResponse = LoginResponse.fromJson(jsondata);
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
    var url = urlAer + endPoint;
    var response = await http.get(url, headers: updateHeaders());
    if (response.statusCode==200){
      print("success");
    return json.decode(response.body);
    }else {
      int statusCode = HttpStatus.ok;
      print(statusCode);
    }
  }

  Map<String,String> updateHeaders() {
    print(token);
    return {
      'Content-Type': 'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjAxNWUyMTgxNzc2NjVkODUwZWYzZWQ0NWMyMTE5ZTBkMjQ1ZTZlMDlmMGI4NGM4OTYwMTBjMDlkODI1MjEzYTZjZDcwZjVkOGU1NDNjM2RhIn0.eyJhdWQiOiIxIiwianRpIjoiMDE1ZTIxODE3NzY2NWQ4NTBlZjNlZDQ1YzIxMTllMGQyNDVlNmUwOWYwYjg0Yzg5NjAxMGMwOWQ4MjUyMTNhNmNkNzBmNWQ4ZTU0M2MzZGEiLCJpYXQiOjE2MDUwODYxNTEsIm5iZiI6MTYwNTA4NjE1MSwiZXhwIjoxNjM2NjIyMTUxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.PV5Q9dxqcC8wBdfDYx8xCvondoi6j79IrvbDCuYufWZ7eXJ5LzC0HB1zR_uxYLgSLwLYY9i_n0wCsrast5d1BUoR2ODdW5wDu-Y11_uOX7q72Jvhc9MyJ7fK5l_0kDXegSrtMmh_8yeI5hbD4YoGbiwT0L-b1N2SvWrQOvtnyf347H18jB1FNoiuI87T_P_3RqPgMFCLgQkk0AHXrwdqeya25MuUsIKsiaKdl5fTKdWQLexyDXaQgyvZ2Ona5kbsC77avuRrX1x7XxYdQhIuZi3lYsN8ZoCyiFS9ry5Sm4QyO-8VCcgYv5FjOo8B1plm3uyVN7Snkjbf41hIA9nn89fXGqGRPOrVagsQMBlK-YTD6M0eIPODbCxIohWlEM0PeXNwAZyOOjHh068zXnQSaYYx7F_0ZxmOze8QbHxm1JmvDocrHeALGaWQpPce_8HGKxMLCerW5AvcZR4jxNdvG9RVSkPCvWdA499APKsEdRhJ2nh5HWOEA0ow-pF57K03VD8ubZ3CE8g7a-XsTsQJGOejVZoSYZe31X4snFl9Tehvi-0WkmoWPNiUwzSbyMUyyXv-6H8hOX9pnwtdnN_GB5gfOa4HufJB_5UXh6oa9IaNk0LB3sbncy5lS6-av3rWNl9XCgNLYtgEq-cNXPRE0GWBG-k5EYNUGPaaBPXwHoI',
      'X-localization':'en'
    };
  }

  Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('Token');
    return token;
  }

}


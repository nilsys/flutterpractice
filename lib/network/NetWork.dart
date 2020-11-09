import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterpractice/Model/HomeResponse.dart';
import 'package:flutterpractice/ui/Home.dart';
import 'package:http/http.dart' as http;

class NetWork {
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

  Future<List<Data>> getNearBy() async {
    var url ="https://aerbag-dev.intcore.net/api/users/categories/1/lat/37.33233141/long/-122.0312186?page=1";
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept':'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1YmU0NGM3ODI1YzNlNTMyMGUxNWNhY2ZlZDE1ZDFiNGU4YTNmYjdhNmUwN2VlYzhiYmYzODkyMjU0OGQ1OGJlN2UyNGZhZGMzYTg4YTYyIn0.eyJhdWQiOiIxIiwianRpIjoiOTViZTQ0Yzc4MjVjM2U1MzIwZTE1Y2FjZmVkMTVkMWI0ZThhM2ZiN2E2ZTA3ZWVjOGJiZjM4OTIyNTQ4ZDU4YmU3ZTI0ZmFkYzNhODhhNjIiLCJpYXQiOjE2MDQ1NjY4MDcsIm5iZiI6MTYwNDU2NjgwNywiZXhwIjoxNjM2MTAyODA3LCJzdWIiOiI3NSIsInNjb3BlcyI6W119.gTE8orOX3CPy-7IkVRYnH0hGps2jh3uFaMDFQA4W0thvpmVH0J7dPIPKLUF4cg2vwtXmTZaOVuvg7U5wNdF69AtJJpI2bk_Hq3ZCRLH9-u67RtIacsiPK5wUyjsMs-j6fb18GyrUy2rw_yvrsnuPuxacaHD0YJvk9PhwiAnho4Fooks8yZDZwG_i5xcCAjCFif3V3hV6Q20kgJ4fmmJiFKmmPQgJAHpGvzFJ-lmh0yyF32s9inSagJLSs4Xf9L1SquEb_ucgJnggUkJ3E_5yr_dGqtNbHsQKiMLKEku9CVM1MuZC9asmQm4w_ODfhhU-OjPno5kA0MO4YFYuxG4bJG5JDbiGcQcJ52OEdUmShOW-wVVXOlUU8GNInbywZSu5mXFmFJLEqUVYnvjp5G0CioqBCoSoOIUj7ZbY37gtDj3Un6UFtq86YKIewMSCq0c_q5s-ZzibkGnkUYK5s8j8oBOa9LtTdoYH7hxIxp2V4cDKU7unQ0iRJPcAZfpoIyGYWauTjgG46NQNE2tA14we2RVAuL_tV1RlBwATJ5JM5ezauY5MhTMH8tO_bOcbkELgal2XH2Gp74AmilhhvjTgzzwgz4gOdOBr8wglNOkfccc8xc_vCWCIwvsuzvFIj2Mpw4QyhS0pto7qJi4So_hYAw6jf6FgQBWp_Xdgs4MRoIU'
      , 'X-localization':'en'
    },);
   // print(response.body);

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
      throw Exception('Failed to load album');
    }
  }
}
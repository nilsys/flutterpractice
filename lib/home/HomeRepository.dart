import 'package:flutterpractice/Model/HomeResponse.dart';
import 'package:flutterpractice/Model/NearbyResponse.dart';
import 'package:flutterpractice/network/Network.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  String url = "https://aerbag-dev.intcore.net/api/";
  Network network;

  HomeRepository() {
    network = Network();
  }

  Future<List<Provider>> getNearby(String endpoint) async {
    var jsonData = await network.get(endpoint);
    NearbyResponse homeResponse = await NearbyResponse.fromJson(jsonData);
    return homeResponse.provider;
  }
}
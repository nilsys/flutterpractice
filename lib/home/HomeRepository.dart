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

  Future<NearbyResponse> getNearby(String endpoint) async {
    var jsonData = await network.get(endpoint);
    NearbyResponse nearbyResponse = await NearbyResponse.fromJson(jsonData);
    print(nearbyResponse.provider[0].name);
    print(nearbyResponse.provider[0].location);
    return nearbyResponse;
  }
}
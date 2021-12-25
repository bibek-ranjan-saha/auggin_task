import 'package:auggin_task/models/WeatherData.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<Welcome?> fetchWeathers(String city) async {
    var response = await client.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=0645404ec6534ea39e7720b364e0a25f"));
    if(response.statusCode == 200)
      {
        var jsonString = response.body;
        return welcomeFromJson(jsonString);
      }
    else{
      return null;
    }
  }
}

Future<Welcome> fetchWeatherFeed(String city) async {
  final response = await http.get(
    Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=0645404ec6534ea39e7720b364e0a25f"),
    // headers: {"q": city, "appid": "0645404ec6534ea39e7720b364e0a25f"},
  );
  if (response.statusCode == 200) {
    print(response.body);
    return welcomeFromJson(response.body);
  } else {
    print(response.body);
    throw Exception('Failed to load search');
  }
}

import 'package:auggin_task/models/WeatherData.dart';
import 'package:auggin_task/services/remote_services.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var weathers = <Welcome?>[].obs;

  @override
  void onInit() {
    fetchAllWeathers();
    super.onInit();
  }

  void fetchAllWeathers() async {
    var delhiWeather = await RemoteService.fetchWeathers("delhi");
    var mumbaiWeather = await RemoteService.fetchWeathers("mumbai");
    var jaipurWeather = await RemoteService.fetchWeathers("jaipur");
    var hyderabadWeather = await RemoteService.fetchWeathers("hyderabad");
    var chennaiWeather = await RemoteService.fetchWeathers("chennai");

    var serverResponse = [
      delhiWeather,
      mumbaiWeather,
      jaipurWeather,
      hyderabadWeather,
      chennaiWeather
    ];
    weathers.value = serverResponse;
    isLoading(false);
  }
}

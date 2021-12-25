import 'package:auggin_task/controllers/WeatherController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Color color;
  final WeatherController weatherController;
  final int index;
  final Orientation ori;

  const CardItem(
      {Key? key,
      required this.color,
      required this.weatherController,
      required this.index,
      required this.ori})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color.withOpacity(0.3), color]),
            borderRadius: BorderRadius.circular(20.0)),
        child: ori == Orientation.portrait
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  CachedNetworkImage(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    imageUrl:
                        "http://openweathermap.org/img/w/${weatherController.weathers[index]!.weather[0].icon}.png",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Text(
                    "City : " +
                        weatherController.weathers[index]!.name.toString() +
                        "\nWeather : " +
                        weatherController.weathers[index]!.weather[0].main
                            .toString() +
                        "\nWeather Description : " +
                        weatherController
                            .weathers[index]!.weather[0].description
                            .toString() +
                        "\nTemperature : " +
                        weatherController.weathers[index]!.main.temp
                            .toString() +
                        "\nTemperature feels like : " +
                        weatherController.weathers[index]!.main.feelsLike
                            .toString() +
                        "\nMaximum temperature : " +
                        weatherController.weathers[index]!.main.tempMax
                            .toString() +
                        "\nMinimum temperature : " +
                        weatherController.weathers[index]!.main.tempMin
                            .toString() +
                        "\nPressure : " +
                        weatherController.weathers[index]!.main.pressure
                            .toString() +
                        "\nHumidity : " +
                        weatherController.weathers[index]!.main.humidity
                            .toString() +
                        "\nWeather visibility : " +
                        weatherController.weathers[index]!.visibility
                            .toString() +
                        "\nWind speed : " +
                        weatherController.weathers[index]!.wind.speed
                            .toString() +
                        "\nWind Degree : " +
                        weatherController.weathers[index]!.wind.deg.toString() +
                        "\nClouds : " +
                        weatherController.weathers[index]!.clouds.all
                            .toString(),
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "City : " +
                            weatherController.weathers[index]!.name.toString() +
                            "\nWeather : " +
                            weatherController.weathers[index]!.weather[0].main
                                .toString() +
                            "\nWeather Description : " +
                            weatherController
                                .weathers[index]!.weather[0].description
                                .toString() +
                            "\nTemperature : " +
                            weatherController.weathers[index]!.main.temp
                                .toString() +
                            "\nTemperature feels like : " +
                            weatherController.weathers[index]!.main.feelsLike
                                .toString() +
                            "\nMaximum temperature : " +
                            weatherController.weathers[index]!.main.tempMax
                                .toString() +
                            "\nMinimum temperature : " +
                            weatherController.weathers[index]!.main.tempMin
                                .toString() +
                            "\nPressure : " +
                            weatherController.weathers[index]!.main.pressure
                                .toString() +
                            "\nHumidity : " +
                            weatherController.weathers[index]!.main.humidity
                                .toString() +
                            "\nWeather visibility : " +
                            weatherController.weathers[index]!.visibility
                                .toString() +
                            "\nWind speed : " +
                            weatherController.weathers[index]!.wind.speed
                                .toString() +
                            "\nWind Degree : " +
                            weatherController.weathers[index]!.wind.deg
                                .toString() +
                            "\nClouds : " +
                            weatherController.weathers[index]!.clouds.all
                                .toString(),
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CachedNetworkImage(
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      imageUrl:
                          "http://openweathermap.org/img/w/${weatherController.weathers[index]!.weather[0].icon}.png",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator.adaptive(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:auggin_task/controllers/WeatherController.dart';
import 'package:auggin_task/views/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Weather"),
      ),
      body: Obx(() {
        if (weatherController.isLoading.value) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (widget, animation) {
                return ScaleTransition(scale: animation, child: widget);
              },
              child: orientation == Orientation.portrait
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: weatherController.weathers.length,
                      itemBuilder: (context, index) => SizedBox(
                            width: double.infinity,
                            child: CardItem(
                              color: Colors
                                  .primaries[index % Colors.primaries.length],
                              index: index,
                              weatherController: weatherController,
                              ori: orientation,
                            ),
                          ))
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: weatherController.weathers.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CardItem(
                              color: Colors
                                  .primaries[index % Colors.primaries.length],
                              index: index,
                              weatherController: weatherController,
                              ori: orientation,
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                    ),
            ),
          );
        }
      }),
    );
  }
}

import 'package:auggin_task/views/info.dart';
import 'package:auggin_task/views/weather.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'camera.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auggin Task"),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                    color: Colors.blueGrey,
                    child: const Text("Show Weather"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Weather()));
                    }),
                CupertinoButton(
                    color: Colors.blueGrey,
                    child: const Text("Launch camera"),
                    onPressed: () async {
                      await availableCameras().then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Camera(cameras: value))));
                    }),
                CupertinoButton(
                    color: Colors.blueGrey,
                    child: const Text("More about me"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Info()));
                    }),
                CupertinoButton(
                    color: Colors.blueGrey,
                    child: const Text("Exit from App"),
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: const Text(
                  "Are you sure you want to exit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                actions: [
                  CupertinoButton(
                      child: const Text("YES"),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.back();
                      }),
                  CupertinoButton(
                      child: const Text("NO"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ));
      return Future.value(true);
    }
  }
}

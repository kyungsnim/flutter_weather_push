import 'package:flutter/material.dart';
import 'package:flutter_weather_push/src/app.dart';
import 'package:flutter_weather_push/src/controller/covid_statistics_controller.dart';
import 'package:flutter_weather_push/src/select_my_area.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(CovidStatisticsController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SelectMyArea(),//App(),
    );
  }
}
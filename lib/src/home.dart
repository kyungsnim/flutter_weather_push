import 'package:flutter/material.dart';
import 'package:flutter_weather_push/src/select_my_area.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final selectedOne, selectedTwo, selectedThree;

  Home({this.selectedOne, this.selectedTwo, this.selectedThree});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  child: Text('주소 검색'),
                  onPressed: () {
                    Get.to(() => SelectMyArea());
                  }),
              Text('$selectedOne $selectedTwo $selectedThree'),
            ],
          ),
        ),
      ),
    );
  }
}

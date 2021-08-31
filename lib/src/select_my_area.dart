import 'package:flutter/material.dart';
import 'package:flutter_weather_push/src/select_my_area_level_two.dart';
import 'package:get/get.dart';

class SelectMyArea extends StatelessWidget {

  final level1 = ['강원도', '경기도', '경상남도', '경상북도', '광주광역시', '대구광역시', '대전광역시', '부산광역시', '서울특별시', '세종특별자치시', '울산광역시', '이어도',
  '인천광역시', '전라남도', '전라북도', '제주특별자치도', '충청남도', '충청북도'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('주소 검색'),),
      body: Container(
        child: ListView.builder(itemCount: level1.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: GestureDetector(
              onTap: () {
                Get.to(() => SelectMyAreaLevelTwo(level1[index]));
              },
              child: ListTile(
                title: Text(level1[index], style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },)
      )
    );
  }
}

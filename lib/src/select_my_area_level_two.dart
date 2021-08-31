import 'package:flutter/material.dart';
import 'package:flutter_weather_push/src/select_my_area_level_three.dart';
import 'package:get/get.dart';

class SelectMyAreaLevelTwo extends StatelessWidget {

  final selectedLevelOne;
  final level1 = [
    '강원도강릉시',
    '강원도고성군',
    '강원도동해시',
    '강원도삼척시',
    '강원도속초시',
    '강원도양구군',
    '강원도양양군',
    '강원도영월군',
    '강원도원주시',
    '강원도인제군',
    '강원도정선군',
    '강원도철원군',
    '강원도춘천시',
    '강원도태백시',
    '강원도평창군',
    '강원도홍천군',
    '강원도화천군',
    '강원도횡성군',
    '강원도4',
    '경기도1',
    '경기도2',
    '경기도3',
    '경기도4',
    '경상남도1',
    '경상남도2',
    '경상남도3',
    '경상남도4',
    '경상남도5',
    '경상북도1',
    '경상북도2',
    '경상북도3',
    '경상북도4',
    '경상북도5',
    '광주광역시',
    '대구광역시',
    '대전광역시',
    '부산광역시', '서울특별시', '세종특별자치시', '울산광역시', '이어도',
  '인천광역시', '전라남도', '전라북도', '제주특별자치도', '충청남도', '충청북도'];

  SelectMyAreaLevelTwo(this.selectedLevelOne);

  @override
  Widget build(BuildContext context) {
    List<String> level2 = [];
    for(int i = 0; i < level1.length; i++){
      if(level1[i].contains(selectedLevelOne)) {
        level2.add(level1[i].replaceAll(selectedLevelOne, ""));
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text('$selectedLevelOne'),),
      body: Container(
        child: ListView.builder(itemCount: level2.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: GestureDetector(
              onTap: () {
                Get.to(SelectMyAreaLevelThree(selectedLevelOne, level2[index]));
              },
              child: ListTile(
                title: Text(level2[index], style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },)
      )
    );
  }
}

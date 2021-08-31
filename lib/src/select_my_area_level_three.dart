import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class SelectMyAreaLevelThree extends StatelessWidget {

  final selectedLevelOne;
  final selectedLevelTwo;
  final level2 = [
    '춘천시신북음',
    '춘천시동면',
    '춘천시동산면',
    '춘천시신동면',
    '춘천시남면',
    '춘천시서면',
    '춘천시사북면',
    '춘천시북산면',
    '춘천시동내면',
    '춘천시남산면',
    '춘천시교동',
    '춘천시조운동',
    '춘천시약사명동',
    '춘천시근화동',
    '춘천시소양동',
    '춘천시후평1동',
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

  SelectMyAreaLevelThree(this.selectedLevelOne, this.selectedLevelTwo);

  @override
  Widget build(BuildContext context) {
    List<String> level3 = [];
    for(int i = 0; i < level2.length; i++){
      if(level2[i].contains(selectedLevelTwo)) {
        level3.add(level2[i].replaceAll(selectedLevelTwo, ""));
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text('$selectedLevelOne $selectedLevelTwo'),),
      body: Container(
        child: ListView.builder(itemCount: level3.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: GestureDetector(
              onTap: () {
                Get.offAll(() => Home(selectedOne: selectedLevelOne, selectedTwo: selectedLevelTwo, selectedThree: level3[index]));
              },
              child: ListTile(
                title: Text(level3[index], style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },)
      )
    );
  }
}

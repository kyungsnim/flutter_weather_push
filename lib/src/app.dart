import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_push/src/components/covid_statistics_viewer.dart';
import 'package:flutter_weather_push/src/controller/covid_statistics_controller.dart';
import 'package:get/get.dart';

import 'canvas/arrow_clip_path.dart';
import 'components/bar_chart.dart';

class App extends GetView<CovidStatisticsController> {
  App({Key? key}) : super(key: key);
  double headerTopZone = 0;

  Widget infoWidget(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(
            ' : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }

  List<Widget> _background() {
    return [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Colors.blueAccent, Colors.lightBlue])),
      ),
      Positioned(
        left: -110,
        top: headerTopZone + 40,
        child: Container(
            child: Image.asset(
              'assets/covid_img.png',
              width: Get.size.width * 0.7,
            )),
      ),
      Positioned(
        top: headerTopZone + 10,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.indigo),
            child: Obx(
                  () => Text(
                controller.todayData.standardDayString,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          top: headerTopZone + 60,
          right: 40,
          child: CovidStatisticsViewer(
            title: '확진자',
            addedCount: controller.todayData.calcDecideCnt,
            totalCount: controller.todayData.decideCnt ?? 0,
            upDown: ArrowDirection.UP,
            titleColor: Colors.white,
            subValueColor: Colors.white,
          ))
    ];
  }

  Widget _todayStatistics() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: CovidStatisticsViewer(
              title: '격리해제',
              addedCount: controller.todayData.calcClearCnt,
              totalCount: controller.todayData.clearCnt ?? 0,
              upDown:
                  controller.calculateUpDown(controller.todayData.calcClearCnt),
              dense: true,
            ),
          ),
          Container(
              height: 60,
              child: VerticalDivider(
                color: Colors.grey,
              )),
          Expanded(
            child: CovidStatisticsViewer(
              title: '검사 중',
              addedCount: controller.todayData.calcExamCnt < 0 ? controller.todayData.calcExamCnt * -1 : controller.todayData.calcExamCnt,
              totalCount: controller.todayData.examCnt ?? 0,
              upDown: controller
                  .calculateUpDown(controller.todayData.calcExamCnt),
              dense: true,
            ),
          ),
          Container(
              height: 60,
              child: VerticalDivider(
                color: Colors.grey,
              )),
          Expanded(
            child: CovidStatisticsViewer(
              title: '사망자',
              addedCount: controller.todayData.calcDeathCnt,
              totalCount: controller.todayData.deathCnt ?? 0,
              upDown:
                  controller.calculateUpDown(controller.todayData.calcDeathCnt),
              dense: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _covidTrendsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('확진자 추이',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        AspectRatio(
          aspectRatio: 1,
          child: Obx(
            () => controller.weekDays.length == 0 ? Container() : CovidBarChart(
              covidDatas: controller.weekDays,
              maxY: controller.maxDecideValue,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    headerTopZone = Get.mediaQuery.padding.top + AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.white),
        elevation: 0,
        title: Text('코로나 일별 현황', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      extendBodyBehindAppBar: true, // body가 appBar 영역으로 extend 가능하도록
      body: Stack(children: [
        ..._background(),
        Positioned(
            top: headerTopZone + 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      _todayStatistics(),
                      SizedBox(height: 20),
                      _covidTrendsChart()
                    ],
                  ),
                ))))
      ]),
      backgroundColor: Color(0xff3c727c),
    );
  }
}

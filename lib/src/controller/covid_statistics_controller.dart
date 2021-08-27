import 'package:flutter_weather_push/src/canvas/arrow_clip_path.dart';
import 'package:flutter_weather_push/src/model/covid_statistics.dart';
import 'package:flutter_weather_push/src/repository/covid_statistics_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CovidStatisticsController extends GetxController {
  late CovidStatisticsRepository _covidStatisticsRepository;
  Rx<Covid19StatisticsModel> _todayData = Covid19StatisticsModel().obs;
  RxList<Covid19StatisticsModel> _weekDatas = <Covid19StatisticsModel>[].obs;
  double maxDecideValue = 0;

  @override
  void onInit() {
    super.onInit();
    _covidStatisticsRepository = CovidStatisticsRepository();
    fetchCovidState();
  }

  void fetchCovidState() async {
    /// 코로나 파라미터
    // var startDate = DateFormat('yyyyMMdd').format(DateTime.now().subtract(Duration(days: 7)));
    // var endDate = DateFormat('yyyyMMdd').format(DateTime.now());
    /// 기상청 예보 파라미터
    var baseDate = DateFormat('yyyyMMdd').format(DateTime.now());
    var dataType = 'XML';
    var baseTime = '0630';
    var nx = '55';
    var ny = '127';
    /// 코로나 파라미터
    // var result = await _covidStatisticsRepository.fetchCovid19Statistics(startDate: startDate, endDate: endDate);
    /// 기상청 예보 파라미터
    var result = await _covidStatisticsRepository.fetchPredictWeather(dataType: dataType, baseDate: baseDate, baseTime: baseTime, nx: nx, ny: ny);

    if(result.isNotEmpty) {
      for(var i = 0; i < result.length; i++){
        if (i < result.length - 1) {
          result[i].updateCalcAboutYesterday(result[i + 1]);
          if (maxDecideValue < result[i].calcDecideCnt) {
            maxDecideValue = result[i].calcDecideCnt;
          }
        }
      }
      _weekDatas.addAll(result.sublist(0, result.length - 1).reversed);
      _todayData(_weekDatas.last);
    }
  }

  Covid19StatisticsModel get todayData => _todayData.value;
  List<Covid19StatisticsModel> get weekDays => _weekDatas;

  ArrowDirection calculateUpDown(double value) {
    if (value == 0) {
      return ArrowDirection.MIDDLE;
    } else if (value > 0) {
      return ArrowDirection.UP;
    } else {
      return ArrowDirection.DOWN;
    }
  }
}
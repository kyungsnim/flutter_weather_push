import 'package:flutter_weather_push/src/utils/data_utils.dart';
import 'package:flutter_weather_push/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class Covid19StatisticsModel {
  double? accDefRate;
  double? accExamCnt;
  double? accExamCompCnt;
  double? careCnt;
  double? clearCnt;
  double? deathCnt;
  double? decideCnt;
  double? examCnt;
  double? resultNegCnt;
  double? seq;
  double calcDecideCnt = 0;
  double calcExamCnt = 0;
  double calcDeathCnt = 0;
  double calcClearCnt = 0;
  DateTime? stateDt;
  String? stateTime;
  String? createDt;
  String? updateDt;

  Covid19StatisticsModel(
      {this.accDefRate,
        this.accExamCnt,
        this.accExamCompCnt,
        this.careCnt,
        this.clearCnt,
        this.createDt,
        this.deathCnt,
        this.decideCnt,
        this.examCnt,
        this.resultNegCnt,
        this.seq,
        this.stateDt,
        this.stateTime,
        this.updateDt});

  factory Covid19StatisticsModel.empty() {
    return Covid19StatisticsModel();
  }

  factory Covid19StatisticsModel.fromXml(XmlElement xml) {
    return Covid19StatisticsModel(
        accExamCnt : XmlUtils.searchResultForDouble(xml, 'accExamCnt'),
        accExamCompCnt : XmlUtils.searchResultForDouble(xml, 'accExamCompCnt'),
        careCnt : XmlUtils.searchResultForDouble(xml, 'careCnt'),
        clearCnt : XmlUtils.searchResultForDouble(xml, 'clearCnt'),
        deathCnt : XmlUtils.searchResultForDouble(xml, 'deathCnt'),
        decideCnt : XmlUtils.searchResultForDouble(xml, 'decideCnt'),
        examCnt : XmlUtils.searchResultForDouble(xml, 'examCnt'),
        resultNegCnt : XmlUtils.searchResultForDouble(xml, 'resutlNegCnt'),
        seq : XmlUtils.searchResultForDouble(xml, 'seq'),
        stateDt : XmlUtils.searchResultForString(xml, 'stateDt') != '' ? DateTime.parse(XmlUtils.searchResultForString(xml, 'stateDt')) : null,
        stateTime : XmlUtils.searchResultForString(xml, 'stateTime'),
        createDt : XmlUtils.searchResultForString(xml, 'createDt'),
        updateDt : XmlUtils.searchResultForString(xml, 'updateDt')
    );
  }

  void updateCalcAboutYesterday(Covid19StatisticsModel yesterdayData) {
    _updateCalcExamCnt(yesterdayData.examCnt!);
    _updateCalcDecideCnt(yesterdayData.decideCnt!);
    _updateCalcDeathCnt(yesterdayData.deathCnt!);
    _updateCalcClearCnt(yesterdayData.clearCnt!);
  }

  void _updateCalcDecideCnt(double beforeCnt) {
    calcDecideCnt = decideCnt! - beforeCnt;
  }

  void _updateCalcExamCnt(double beforeCnt) {
    calcExamCnt = examCnt! - beforeCnt;
  }

  void _updateCalcDeathCnt(double beforeCnt) {
    calcDeathCnt = deathCnt! - beforeCnt;
  }

  void _updateCalcClearCnt(double beforeCnt) {
    calcClearCnt = clearCnt! - beforeCnt;
  }

  String get standardDayString => stateDt == null ? '' : '${DataUtils.simpleDayFormat(stateDt!)} $stateTime 기준';
}
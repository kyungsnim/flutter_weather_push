import 'package:dio/dio.dart';
import 'package:flutter_weather_push/src/model/covid_statistics.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepository {
  late var _dio;

  final bookshelfXml = '''
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <accDefRate>1.6924008113</accDefRate>
                <accExamCnt>11433347</accExamCnt>
                <accExamCompCnt>11158586</accExamCompCnt>
                <careCnt>20400</careCnt>
                <clearCnt>166375</clearCnt>
                <createDt>2021-07-25 09:32:34.468</createDt>
                <deathCnt>2073</deathCnt>
                <decideCnt>188848</decideCnt>
                <examCnt>274761</examCnt>
                <resutlNegCnt>10969738</resutlNegCnt>
                <seq>583</seq>
                <stateDt>20210725</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6794988233</accDefRate>
                <accExamCnt>11430525</accExamCnt>
                <accExamCompCnt>11155828</accExamCompCnt>
                <careCnt>20048</careCnt>
                <clearCnt>165246</clearCnt>
                <createDt>2021-07-24 09:38:51.376</createDt>
                <deathCnt>2068</deathCnt>
                <decideCnt>187362</decideCnt>
                <examCnt>274697</examCnt>
                <resutlNegCnt>10968466</resutlNegCnt>
                <seq>582</seq>
                <stateDt>20210724</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6717199382</accDefRate>
                <accExamCnt>11388305</accExamCnt>
                <accExamCompCnt>11110294</accExamCompCnt>
                <careCnt>19461</careCnt>
                <clearCnt>164206</clearCnt>
                <createDt>2021-07-23 09:37:34.575</createDt>
                <deathCnt>2066</deathCnt>
                <decideCnt>185733</decideCnt>
                <examCnt>278011</examCnt>
                <resutlNegCnt>10924561</resutlNegCnt>
                <seq>581</seq>
                <stateDt>20210723</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6624163319</accDefRate>
                <accExamCnt>11343918</accExamCnt>
                <accExamCompCnt>11074422</accExamCompCnt>
                <careCnt>18967</careCnt>
                <clearCnt>163073</clearCnt>
                <createDt>2021-07-22 09:39:47.617</createDt>
                <deathCnt>2063</deathCnt>
                <decideCnt>184103</decideCnt>
                <examCnt>269496</examCnt>
                <resutlNegCnt>10890319</resutlNegCnt>
                <seq>580</seq>
                <stateDt>20210722</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6499811252</accDefRate>
                <accExamCnt>11298677</accExamCnt>
                <accExamCompCnt>11046490</accExamCompCnt>
                <careCnt>18571</careCnt>
                <clearCnt>161634</clearCnt>
                <createDt>2021-07-21 09:38:25.219</createDt>
                <deathCnt>2060</deathCnt>
                <decideCnt>182265</decideCnt>
                <examCnt>252187</examCnt>
                <resutlNegCnt>10864225</resutlNegCnt>
                <seq>579</seq>
                <stateDt>20210721</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6396458500</accDefRate>
                <accExamCnt>11251987</accExamCnt>
                <accExamCompCnt>11007316</accExamCompCnt>
                <careCnt>18075</careCnt>
                <clearCnt>160347</clearCnt>
                <createDt>2021-07-20 09:37:01.254</createDt>
                <deathCnt>2059</deathCnt>
                <decideCnt>180481</decideCnt>
                <examCnt>244671</examCnt>
                <resutlNegCnt>10826835</resutlNegCnt>
                <seq>578</seq>
                <stateDt>20210720</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6348035828</accDefRate>
                <accExamCnt>11202434</accExamCnt>
                <accExamCompCnt>10961745</accExamCompCnt>
                <careCnt>17515</careCnt>
                <clearCnt>159630</clearCnt>
                <createDt>2021-07-19 09:38:09.418</createDt>
                <deathCnt>2058</deathCnt>
                <decideCnt>179203</decideCnt>
                <examCnt>240689</examCnt>
                <resutlNegCnt>10782542</resutlNegCnt>
                <seq>577</seq>
                <stateDt>20210719</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6265280434</accDefRate>
                <accExamCnt>11175981</accExamCnt>
                <accExamCompCnt>10940543</accExamCompCnt>
                <careCnt>16941</careCnt>
                <clearCnt>158953</clearCnt>
                <createDt>2021-07-18 09:33:01.419</createDt>
                <deathCnt>2057</deathCnt>
                <decideCnt>177951</decideCnt>
                <examCnt>235438</examCnt>
                <resutlNegCnt>10762592</resutlNegCnt>
                <seq>576</seq>
                <stateDt>20210718</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>9</totalCount>
    </body>
</response>
  ''';

  CovidStatisticsRepository() {
    _dio = Dio(BaseOptions(
      /// 코로나 일별 현황
      // baseUrl: 'http://openapi.data.go.kr',
      /// 기상청 단기예보 조회
      baseUrl: 'http://apis.data.go.kr',
      queryParameters: {
        'ServiceKey':
        'CWJbjyZDF4tcdWSfQl1Y7D0akUw1O60l7XdJ2jslvQeKkCfst7qLw0S20cngfj6bxz7Hvp71tsN5csOAoztR2Q=='
      },
    ));
  }

  Future<List<Covid19StatisticsModel>> fetchCovid19Statistics({String? startDate, String? endDate}) async {

    var query = Map<String, String>();
    /// 코로나 일별 현황 파라미터
    if (startDate != null) query.putIfAbsent('startCreateDt', () => startDate);
    if (endDate != null) query.putIfAbsent('endCreateDt', () => endDate);

    /// 코로나 일별 현황
    var response =
        await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson', queryParameters: query);
    final document = XmlDocument.parse(response.data);
    // final document = XmlDocument.parse(bookshelfXml);
    final results = document.findAllElements('item');

    if(results.isNotEmpty) {
      // return Covid19StatisticsModel.fromXml(results.first);
      return results.map<Covid19StatisticsModel>((element) => Covid19StatisticsModel.fromXml(element)).toList();
    } else {
      return Future.value(null);
    }
  }

  Future<List<Covid19StatisticsModel>> fetchPredictWeather({String? dataType, String? baseDate, String? baseTime, String? nx, String? ny}) async {

    var query = Map<String, String>();
    /// 기상청_단기예보 조회 파라미터
    if (dataType != null) query.putIfAbsent('dataType', () => dataType);
    if (baseDate != null) query.putIfAbsent('base_date', () => baseDate);
    if (baseTime != null) query.putIfAbsent('base_time', () => baseTime);
    if (nx != null) query.putIfAbsent('nx', () => nx);
    if (ny != null) query.putIfAbsent('ny', () => ny);

    /// 기상청_단기예보 조회
    var response =
    await _dio.get('/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst', queryParameters: query);
    final document = XmlDocument.parse(response.data);
    // final document = XmlDocument.parse(bookshelfXml);
    final results = document.findAllElements('item');

    if(results.isNotEmpty) {
      // return Covid19StatisticsModel.fromXml(results.first);
      return results.map<Covid19StatisticsModel>((element) => Covid19StatisticsModel.fromXml(element)).toList();
    } else {
      return Future.value(null);
    }
  }
}

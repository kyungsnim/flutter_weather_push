// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_weather_push/main.dart';
import 'package:xml/xml.dart';

void main() {
  final bookshelfXml = '''<?xml version="1.0"?>
    <response>
<header>
<resultCode>00</resultCode>
<resultMsg>NORMAL SERVICE.</resultMsg>
</header>
<body>
<items>
<item>
<accDefRate>3.2396602365</accDefRate>
<accExamCnt>268212</accExamCnt>
<accExamCompCnt>251940</accExamCompCnt>
<careCnt>7300</careCnt>
<clearCnt>834</clearCnt>
<createDt>2020-03-15 10:01:22.22</createDt>
<deathCnt>75</deathCnt>
<decideCnt>8162</decideCnt>
<examCnt>16272</examCnt>
<resutlNegCnt>243778</resutlNegCnt>
<seq>74</seq>
<stateDt>20200315</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2020-03-15 10:01:22.22</updateDt>
</item>
<item>
<accDefRate>3.3180003364</accDefRate>
<accExamCnt>261335</accExamCnt>
<accExamCompCnt>243701</accExamCompCnt>
<careCnt>7402</careCnt>
<clearCnt>714</clearCnt>
<createDt>2020-03-14 10:29:11.11</createDt>
<deathCnt>72</deathCnt>
<decideCnt>8086</decideCnt>
<examCnt>17634</examCnt>
<resutlNegCnt>235615</resutlNegCnt>
<seq>73</seq>
<stateDt>20200314</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2020-03-14 10:29:11.11</updateDt>
</item>
<item>
<accDefRate>3.4584993086</accDefRate>
<accExamCnt>248647</accExamCnt>
<accExamCompCnt>230707</accExamCompCnt>
<careCnt>7470</careCnt>
<clearCnt>510</clearCnt>
<createDt>2020-03-13 10:07:22.22</createDt>
<deathCnt>67</deathCnt>
<decideCnt>7979</decideCnt>
<examCnt>17940</examCnt>
<resutlNegCnt>222728</resutlNegCnt>
<seq>72</seq>
<stateDt>20200313</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2020-03-13 10:07:22.22</updateDt>
</item>
<item>
<accDefRate>3.6217442732</accDefRate>
<accExamCnt>234998</accExamCnt>
<accExamCompCnt>217271</accExamCompCnt>
<careCnt>7407</careCnt>
<clearCnt>333</clearCnt>
<createDt>2020-03-12 10:37:03.03</createDt>
<deathCnt>66</deathCnt>
<decideCnt>7869</decideCnt>
<examCnt>17727</examCnt>
<resutlNegCnt>209402</resutlNegCnt>
<seq>71</seq>
<stateDt>20200312</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2020-03-12 10:37:03.03</updateDt>
</item>
<item>
<accDefRate>3.8041745358</accDefRate>
<accExamCnt>222395</accExamCnt>
<accExamCompCnt>203855</accExamCompCnt>
<careCnt>7212</careCnt>
<clearCnt>288</clearCnt>
<createDt>2020-03-11 10:17:19.19</createDt>
<deathCnt>60</deathCnt>
<decideCnt>7755</decideCnt>
<examCnt>18540</examCnt>
<resutlNegCnt>196100</resutlNegCnt>
<seq>70</seq>
<stateDt>20200311</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2020-03-11 10:17:19.19</updateDt>
</item>
<item>
<accDefRate>3.9193080566</accDefRate>
<accExamCnt>210144</accExamCnt>
<accExamCompCnt>191692</accExamCompCnt>
<careCnt>7165</careCnt>
<clearCnt>247</clearCnt>
<createDt>2020-03-10 10:20:27.27</createDt>
<deathCnt>54</deathCnt>
<decideCnt>7513</decideCnt>
<examCnt>18452</examCnt>
<resutlNegCnt>184179</resutlNegCnt>
<seq>69</seq>
<stateDt>20200310</stateDt>
<stateTime>00:00</stateTime>
<updateDt>2020-03-10 10:20:27.27</updateDt>
</item>
</items>
<numOfRows>10</numOfRows>
<pageNo>1</pageNo>
<totalCount>6</totalCount>
</body>
</response>''';

  test('코로나 전체 통계', () {
    final document = XmlDocument.parse(bookshelfXml);
    final items = document.findAllElements('item');
    var covid19Statics = <Covid19StatisticsModel>[];
    items.forEach((node) {
      covid19Statics.add(Covid19StatisticsModel.fromXml(node));
    });

    covid19Statics.forEach((covid19) {
      print('${covid19.stateDt} : ${covid19.decideCnt}');
    });
  });
}

class Covid19StatisticsModel {
  String? accDefRate;
  String? accExamCnt;
  String? accExamCompCnt;
  String? careCnt;
  String? clearCnt;
  String? createDt;
  String? deathCnt;
  String? decideCnt;
  String? examCnt;
  String? resultNegCnt;
  String? seq;
  String? stateDt;
  String? stateTime;
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

  factory Covid19StatisticsModel.fromXml(XmlElement xml) {
    return Covid19StatisticsModel(
        accDefRate : XmlUtils.searchResult(xml, 'accDefRate'),
        accExamCnt : XmlUtils.searchResult(xml, 'accExamCnt'),
        accExamCompCnt : XmlUtils.searchResult(xml, 'accExamCompCnt'),
        careCnt : XmlUtils.searchResult(xml, 'careCnt'),
        clearCnt : XmlUtils.searchResult(xml, 'clearCnt'),
        createDt : XmlUtils.searchResult(xml, 'createDt'),
        deathCnt : XmlUtils.searchResult(xml, 'deathCnt'),
        decideCnt : XmlUtils.searchResult(xml, 'decideCnt'),
        examCnt : XmlUtils.searchResult(xml, 'examCnt'),
        resultNegCnt : XmlUtils.searchResult(xml, 'resutlNegCnt'),
        seq : XmlUtils.searchResult(xml, 'seq'),
        stateDt : XmlUtils.searchResult(xml, 'stateDt'),
        stateTime : XmlUtils.searchResult(xml, 'stateTime'),
        updateDt : XmlUtils.searchResult(xml, 'updateDt')
    );
  }
}

class XmlUtils {
  static String searchResult(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty ? "" :
    xml.findAllElements(key).map((e) => e.text).first;
  }
}
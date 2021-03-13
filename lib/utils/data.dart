import 'package:charts_flutter/flutter.dart' as charts;
import 'crime_chart.dart';
import 'package:map/utils/crime_series.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      crime: "Drugs",
      value: 70,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff85A0FF)),
    ),
    SubscriberSeries(
      crime: "Murder",
      value: 75,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff85A0FF)),
    ),
    SubscriberSeries(
      crime: "Robbery",
      value: 90,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff85A0FF)),
    ),
    SubscriberSeries(
      crime: "Molestation",
      value: 68,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff85A0FF)),
    ),
    SubscriberSeries(
      crime: "Others",
      value: 50,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff85A0FF)),
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SubscriberChart(
          data:data
        )
      ),
    );
  }
}
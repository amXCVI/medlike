import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final DateTime x;
  final double? y;
  final double? y1;
}

class DiaryGraph extends StatelessWidget {
  const DiaryGraph({
    Key? key,
    required this.items,
    required this.firstDate,
    required this.lastDate
  }) : super(key: key);

  final List<DiaryItem> items;
  final DateTime firstDate;
  final DateTime lastDate; 

  @override
  Widget build(BuildContext context) {
    final chart = items.map((e) => 
      ChartData(
        e.date, 
        e.value.innerData[0], 
        e.value.innerData.length > 1 ? e.value.innerData[1] : null
      )
    ).toList();

    final chartData = [
      ChartData(firstDate, null, null), 
      ...chart,
      ChartData(lastDate, null, null),
    ];

    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      series: <CartesianSeries>[
        SplineSeries<ChartData, DateTime>(
          dataSource: chartData,
          color: const Color.fromRGBO(60, 148, 168, 1),
          markerSettings: const MarkerSettings(
            isVisible: true
          ),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y
        ),
        if(items.isNotEmpty && items[0].value.innerData.length > 1) 
          SplineSeries<ChartData, DateTime>(
            dataSource: chartData,
              markerSettings: const MarkerSettings(
              isVisible: true
            ),
            color: const Color.fromRGBO(60, 148, 168, 1),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1
        )
      ]
    );
  }
}

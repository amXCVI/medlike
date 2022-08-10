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
        if(items.isNotEmpty && items[0].value.innerData.length > 1)
          RangeColumnSeries<ChartData, DateTime>(
            dataSource: chartData,
            width: 0.23,
            color: const Color.fromRGBO(237, 245, 247, 1),
            markerSettings: const MarkerSettings(
              isVisible: true,
              color: Color.fromRGBO(60, 148, 168, 1),
              height: 8
            ),
            xValueMapper: (ChartData data, _) => data.x,
            highValueMapper: (ChartData data, _) => data.y,
            lowValueMapper: (ChartData data, _) => data.y1,
          ),
        SplineSeries<ChartData, DateTime>(
          dataSource: chartData,
          color: const Color.fromRGBO(60, 148, 168, 1),
          markerSettings: const MarkerSettings(
            color: Color.fromRGBO(60, 148, 168, 1),
            borderColor: Color.fromRGBO(237, 245, 247, 1),
            borderWidth: 2,
            isVisible: true
          ),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
        if(items.isNotEmpty && items[0].value.innerData.length > 1) 
          SplineSeries<ChartData, DateTime>(
            dataSource: chartData,
            markerSettings: const MarkerSettings(
              color: Color.fromRGBO(60, 148, 168, 1),
              borderColor: Color.fromRGBO(237, 245, 247, 1),
              borderWidth: 2,
              isVisible: true
            ),
            color: const Color.fromRGBO(60, 148, 168, 1),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1
        ),
      ],
      onMarkerRender: (args) {
        if(args.pointIndex != null && chartData[args.pointIndex!].y1 != null) {
          args.borderWidth = 0;
          args.markerHeight = 6;
          args.markerWidth = 6;
        }
      },
    );
  }
}

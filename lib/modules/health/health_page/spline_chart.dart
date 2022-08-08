import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

class SplineChart extends StatelessWidget {
  const SplineChart({
    Key? key,
    required this.value
  }) : super(key: key);

  final List<DiaryItem> value;

  @override
  Widget build(BuildContext context) {
    const names = ['П', 'В', 'С', 'Ч', 'П ', 'С ', 'В '];

    double? mostRecentWeekday(int weekday) {
      for(int i = 0; i < value.length; i++) {
        if(value[i].date.weekday == weekday) {
          return value[i].value.innerData[0];
        }
      }

      return null;
    }

    final chartData = names.map(
      (e) => ChartData(e, mostRecentWeekday(
        names.indexOf(e)
      )) 
    ).toList();

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        interval: 1,
        majorGridLines: const MajorGridLines(
          width: 0
        ),
        majorTickLines: const MajorTickLines(
          width: 0,
        ),
        axisLine: const AxisLine(
          width: 0,
        )
      ),
      primaryYAxis: NumericAxis(
        isVisible: false
      ),
      series: <ChartSeries>[
        SplineSeries<ChartData, String>(
          dataSource: chartData,
          markerSettings: const MarkerSettings(
            isVisible: true
          ),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y
        )
      ]
    );
  }
}

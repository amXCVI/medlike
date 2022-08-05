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

  final List<DataValue> value;

  @override
  Widget build(BuildContext context) {
    const names = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    // TODO: сделать норм генерацию по дням недели
    final List<ChartData> chartData = names.map(
      (e) => ChartData(e, 10) 
    ).toList();

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        SplineSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y
        )
      ]
    );
  }
}

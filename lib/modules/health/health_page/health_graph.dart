import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/health_page/spline_chart.dart';

class HealthGraph extends StatelessWidget {
  const HealthGraph({
    Key? key, 
    this.data
  }) : super(key: key);

  final List<DiaryItem>? data;

  @override
  Widget build(BuildContext context) {
    return SplineChart(
      value: data == null ? [] : data!
    );
  }
}

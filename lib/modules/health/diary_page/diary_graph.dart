import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final DateTime x;
  final double? y;
  final double? y1;
}

class DiaryGraph extends StatefulWidget {
  const DiaryGraph({
    Key? key,
    required this.items,
    required this.firstDate,
    required this.lastDate,
    required this.measureItem,
    required this.decimalDigits
  }) : super(key: key);

  final List<DiaryItem> items;
  final DateTime firstDate;
  final DateTime lastDate;
  final String measureItem;
  final int decimalDigits;

  @override
  State<DiaryGraph> createState() => _DiaryGraphState();
}

class _DiaryGraphState extends State<DiaryGraph> {
  late TrackballBehavior _trackballBehavior;
  late List<ChartData> chartData;

  @override
  void initState(){
    final chart = widget.items.map((e) => 
      ChartData(
        e.date, 
        e.value.innerData[0], 
        e.value.innerData.length > 1 ? e.value.innerData[1] : null
      )
    ).toList();

    chartData = [
      ChartData(widget.firstDate, null, null), 
      ...chart,
      ChartData(widget.lastDate, null, null),
    ];

    _trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      activationMode: ActivationMode.singleTap,
      builder: (context, details) {

        if(details.pointIndex == null) {
          return Container();
        }

        final index = details.pointIndex! - 1;

        if(index >= widget.items.length) {
          return Container();
        }

        DateFormat dateFormat = DateFormat("EE, d MM, h/m", 'ru_RU');
        final val = ValueHelper.getStringFromValues(
          widget.items[index].value.innerData, 
          widget.decimalDigits
        );

        return Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(238, 238, 238, 1)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(val),
                  Text(widget.measureItem)
                ],
              ),
              Text(
                dateFormat.format(widget.items[index].date)
              )
            ]
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      trackballBehavior: _trackballBehavior,
      enableAxisAnimation: true,
      series: <CartesianSeries>[
        if(widget.items.isNotEmpty && widget.items[0].value.innerData.length > 1)
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
        if(widget.items.isNotEmpty && widget.items[0].value.innerData.length > 1) 
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

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
    required this.decimalDigits,
    required this.grouping,
    this.isClean = false
  }) : super(key: key);

  final List<DiaryItem> items;
  final DateTime firstDate;
  final DateTime lastDate;
  final String measureItem;
  final String grouping;
  final int decimalDigits;
  final bool isClean;

  @override
  State<DiaryGraph> createState() => _DiaryGraphState();
}

class _DiaryGraphState extends State<DiaryGraph> {
  late TrackballBehavior _trackballBehavior;
  late List<ChartData> chartData;

  @override
  void initState(){
    chartData = widget.items.map((e) => 
      ChartData(
        e.date, 
        e.value.innerData[0], 
        e.value.innerData.length > 1 ? e.value.innerData[1] : null
      )
    ).toList();

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

        DateFormat dateFormat = DateFormat("d MMMM y", 'ru_RU');
        final val = ValueHelper.getStringFromValues(
          widget.items[index].value.innerData, 
          widget.decimalDigits
        );

        return Container(
          height: 60,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(238, 238, 238, 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      val,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 2,
                        bottom: 5
                      ),
                      child: Text(
                        widget.measureItem,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    dateFormat.format(
                      widget.items[index].date,
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(158, 157, 157, 1)
                    ),
                  ),
                )
              ]
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChartAxisLabel labelFormatter(args) {
      String text = args.text;
      final val = args.value as int;
      final date = DateTime.fromMillisecondsSinceEpoch(val);

      switch(widget.grouping) {
        case 'Week':
          final DateFormat formatter = DateFormat('E','ru_RU');
          text = formatter.format(date).toUpperCase();
          if(widget.isClean) {
            text = text[0];
          }

          break;
        case 'Month':
          final DateFormat formatter = DateFormat('dd','ru_RU');
          text = formatter.format(date).toUpperCase();
          break;
        }

      return ChartAxisLabel(text, args.textStyle);
    }


    DateTimeIntervalType type;
    double interval;
    double width = 0.23;

    switch(widget.grouping) {
      case 'Hour':
        type = DateTimeIntervalType.minutes;
        interval = 15;
        break;
      case 'Day':
        type = DateTimeIntervalType.hours;
        interval = 6;
        width = 0.02;
        break;
      case 'Week':
        type = DateTimeIntervalType.days;
        interval = 1;
        break;
      default:
        type = DateTimeIntervalType.days;
        interval = 1;
    }

    final data = <CartesianSeries>[
      if (widget.items.isNotEmpty && widget.items[0].value.innerData.length > 1)
        RangeColumnSeries<ChartData, DateTime>(
          dataSource: chartData,
          width: width,
          color: const Color.fromRGBO(237, 245, 247, 1),
          markerSettings: const MarkerSettings(
              isVisible: true,
              color: Color.fromRGBO(60, 148, 168, 1),
              height: 8),
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
            isVisible: true),
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
      ),
      if (widget.items.isNotEmpty && widget.items[0].value.innerData.length > 1)
        SplineSeries<ChartData, DateTime>(
            dataSource: chartData,
            markerSettings: const MarkerSettings(
                color: Color.fromRGBO(60, 148, 168, 1),
                borderColor: Color.fromRGBO(237, 245, 247, 1),
                borderWidth: 2,
                isVisible: true),
            color: const Color.fromRGBO(60, 148, 168, 1),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1),
    ];

    if(widget.isClean) {
      return Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: DateTimeAxis(
            interval: interval,
            intervalType: type,
            minimum: widget.firstDate,
            maximum: widget.lastDate,
            axisLabelFormatter: labelFormatter,
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
          series: data
        ),
      );
    }

    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: SfCartesianChart(
        plotAreaBorderWidth: 1,
        plotAreaBorderColor: const Color.fromRGBO(158, 157, 157, 0.4),
        primaryXAxis: DateTimeAxis(
          interval: interval,
          intervalType: type,
          minimum: widget.firstDate,
          maximum: widget.lastDate,
          axisLine: const AxisLine(
            width: 1,
            color: Color.fromRGBO(158, 157, 157, 0.4)
          ),
          axisLabelFormatter: labelFormatter,
          majorGridLines: const MajorGridLines(
            dashArray: <double>[5,3]
          )
        ),
        primaryYAxis: NumericAxis(
          opposedPosition: true,
          axisLine: const AxisLine(
            width: 1,
            color: Color.fromRGBO(158, 157, 157, 0.4)
          ),
          majorGridLines: const MajorGridLines(
            dashArray: <double>[5,3]
          )
        ),
        trackballBehavior: _trackballBehavior,
        enableAxisAnimation: true,
        series: data,
        
        onMarkerRender: (args) {
          if(args.pointIndex != null && chartData[args.pointIndex!].y1 != null) {
            args.borderWidth = 0;
            args.markerHeight = 6;
            args.markerWidth = 6;
          }
        }, 
      )
    );
  }
}

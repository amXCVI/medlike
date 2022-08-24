import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
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
    required this.onSelect,
    required this.onUnselect,
    this.onLoadDate,
    this.isClean = false
  }) : super(key: key);

  final List<DiaryItem> items;
  final DateTime firstDate;
  final DateTime lastDate;
  final String measureItem;
  final String grouping;
  final int decimalDigits;
  final bool isClean;
  final Function(bool)? onLoadDate;
  final Function(int, Offset) onSelect;
  final Function onUnselect;

  @override
  State<DiaryGraph> createState() => _DiaryGraphState();
}

class _DiaryGraphState extends State<DiaryGraph> {
  //late TrackballBehavior _trackballBehavior;
  ChartSeriesController? seriesController;
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
    /*
    _trackballBehavior = TrackballBehavior(
      enable: false,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      activationMode: ActivationMode.singleTap,
      builder: (context, details) {
        if(details.pointIndex == null) {
          return Container();
        }

        final index = details.pointIndex! - 1;

        if(index < 0 || index >= widget.items.length) {
          return Container();
        }

        
      },
    );
    */
    super.initState();
  }

  void performSwipe(ChartSwipeDirection direction) {
    widget.onLoadDate!(direction == ChartSwipeDirection.end);

    if (seriesController != null) {
      seriesController!
        .updateDataSource(addedDataIndexes: []);
    }
  }

  int getXFromDate(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  void onPointTap(ChartPointDetails? details) {
    if(details?.pointIndex != null) {
      CartesianChartPoint<dynamic> chartPoint =
        CartesianChartPoint<dynamic>(
          getXFromDate(chartData[details!.pointIndex!].x),
          chartData[details.pointIndex!].y
        );
      Offset pointLocation = seriesController!.pointToPixel(chartPoint);
      widget.onSelect(details.pointIndex!, pointLocation);
    }
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
          onRendererCreated: (ChartSeriesController controller) {
            seriesController = controller;
          },
          onPointTap: onPointTap
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
        onRendererCreated: (ChartSeriesController controller) {
          seriesController = controller;
        },
        onPointTap: onPointTap,
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
            yValueMapper: (ChartData data, _) => data.y1,
            onRendererCreated: (ChartSeriesController controller) {
              seriesController = controller;
            },
            onPointTap: onPointTap
          ),
    ];

    if(widget.isClean) {
      return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: DateTimeAxis(
          interval: interval,
          intervalType: type,
          minimum: widget.firstDate,
          maximum: widget.lastDate,
          axisLabelFormatter: labelFormatter,
          rangePadding: ChartRangePadding.none,
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
        series: data,

        margin: EdgeInsets.zero
      );
    }

    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: SfCartesianChart(
        onPlotAreaSwipe: (ChartSwipeDirection direction) =>
          performSwipe(direction),
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
        //trackballBehavior: _trackballBehavior,
        enableAxisAnimation: true,
        series: data,
        
        onMarkerRender: (args) {
          if(args.pointIndex != null && chartData[args.pointIndex!].y1 != null) {
            args.borderWidth = 0;
            args.markerHeight = 6;
            args.markerWidth = 6;
          }
        },

        onChartTouchInteractionUp: (args) => widget.onUnselect()
      )
    );
  }
}

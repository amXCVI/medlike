import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_canvas/tap_canvas.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1, this.isAbnormal);
  final DateTime x;
  final double? y;
  final double? y1;
  final bool isAbnormal;
}

class DiaryGraph extends StatefulWidget {
  const DiaryGraph({
    Key? key,
    required this.items,
    required this.firstDate,
    required this.lastDate,
    required this.measureItem,
    required this.decimalDigits,
    required this.minValue,
    required this.maxValue,
    required this.grouping,
    required this.onSelect,
    required this.onUnselect,
    this.selected,
    this.onLoadDate,
    this.isClean = false
  }) : super(key: key);

  final List<DataItem> items;
  final DateTime firstDate;
  final DateTime lastDate;
  final double? selected;
  final String measureItem;
  final String grouping;
  final int decimalDigits;
  final List<double> minValue;
  final List<double> maxValue;
  final bool isClean;
  final Function(bool)? onLoadDate;
  final Function(int, Offset) onSelect;
  final Function onUnselect;

  @override
  State<DiaryGraph> createState() => _DiaryGraphState();
}

class _DiaryGraphState extends State<DiaryGraph> {
  ChartSeriesController? seriesController;

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

  DateTime getDateFromX(double x) {
    return DateTime.fromMillisecondsSinceEpoch(x.floor());
  }

  void onPointTap(ChartPointDetails? details) {
    List<ChartData> chartData = widget.items.map((e) => 
      ChartData(
        e.date, 
        e.innerData[0], 
        e.innerData.length > 1 ? e.innerData[1] : null,
        e.isAbnormal
      )
    ).toList();

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

    List<ChartData> chartData = widget.items.map((e) => 
      ChartData(
        e.date, 
        e.innerData[0], 
        e.innerData.length > 1 ? e.innerData[1] : null,
        e.isAbnormal
      )
    ).toList();

    List<ChartData> abnormalData = chartData.where(
      (e) => e.isAbnormal
    ).toList();

    ChartAxisLabel labelFormatter(args) {
      String text = args.text;
      final val = args.value as int;
      final date = DateTime.fromMillisecondsSinceEpoch(val);

      switch(widget.grouping) {
        case 'Week':
        case '':
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

    switch(widget.grouping) {
      case 'Hour':
        type = DateTimeIntervalType.minutes;
        interval = 15;
        break;
      case 'Day':
        type = DateTimeIntervalType.hours;
        interval = 6;
        break;
      case 'Week':
        type = DateTimeIntervalType.days;
        interval = 1;
        break;
      case 'Month':
        type = DateTimeIntervalType.days;
        interval = 7;
        break;
      default:
        type = DateTimeIntervalType.days;
        interval = 1;
    }

    final data = <CartesianSeries>[
      if (widget.items.isNotEmpty && widget.items[0].innerData.length > 1)
        RangeColumnSeries<ChartData, DateTime>(
          dataSource: chartData,
          width: 0,
          color: const Color.fromRGBO(237, 245, 247, 1),
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: AppColors.mainBrandColor,
            height: 8
          ),
          borderWidth: 10,
          borderColor: AppColors.circleBgSecond,
          xValueMapper: (ChartData data, _) => data.x,
          highValueMapper: (ChartData data, _) => data.y,
          lowValueMapper: (ChartData data, _) => data.y1,
          onRendererCreated: (ChartSeriesController controller) {
            seriesController = controller;
          },
          onPointTap: onPointTap
        ),
      if (widget.items.isNotEmpty && widget.items[0].innerData.length > 1)
        RangeColumnSeries<ChartData, DateTime>(
          dataSource: abnormalData,
          width: 0,
          color: const Color.fromRGBO(237, 245, 247, 1),
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: AppColors.mainBrandColor,
            height: 8
          ),
          borderWidth: 10,
          borderColor: const Color.fromRGBO(254, 235, 240, 1),
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
        color: AppColors.mainBrandColor,
        splineType: SplineType.monotonic,
        pointColorMapper: (ChartData datum, _) {
          final next = chartData.indexOf(datum) + 1;
          //final prev = chartData.indexOf(datum) - 1;

          final isRight = next >= chartData.length || chartData[next].isAbnormal;
          //final isLeft = prev < 0 || chartData[prev].isAbnormal;

          return datum.isAbnormal 
            && isRight //&& isLeft
            ? AppColors.mainError
            : null;
        },
        markerSettings: const MarkerSettings(
          color: AppColors.mainBrandColor,
          borderColor: Color.fromRGBO(237, 245, 247, 1),
          borderWidth: 2,
          isVisible: true
        ),
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        onRendererCreated: (ChartSeriesController controller) {
          seriesController = controller;
        },
        onPointTap: onPointTap,
      ),
      if (widget.items.isNotEmpty && widget.items[0].innerData.length > 1)
        SplineSeries<ChartData, DateTime>(
            dataSource: chartData,
            pointColorMapper: (ChartData datum, _) {
              final next = chartData.indexOf(datum) + 1;
              //final prev = chartData.indexOf(datum) - 1;

              final isRight = next >= chartData.length || chartData[next].isAbnormal;
              //final isLeft = prev < 0 || chartData[prev].isAbnormal;

              return datum.isAbnormal 
                && isRight //&& isLeft
                ? AppColors.mainError
                : null;
            },
            splineType: SplineType.monotonic,
            markerSettings: const MarkerSettings(
              color: Color.fromRGBO(60, 148, 168, 1),
              borderColor: Color.fromRGBO(237, 245, 247, 1),
              borderWidth: 2,
              isVisible: true
            ),
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
      return TapOutsideDetectorWidget(
        onTappedOutside: () => widget.onUnselect(),
        child: SizedBox(
          height: 85,
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(
              plotBands: [
                if(widget.selected != null && seriesController != null) PlotBand(
                  start: seriesController!.pixelToPoint(Offset(widget.selected!, 0)).x,
                  end: seriesController!.pixelToPoint(Offset(widget.selected!, 0)).x,
                  shouldRenderAboveSeries: false,
                  borderWidth: 1,
                  borderColor: Colors.grey.shade300,
                  color: Colors.grey.shade300
                )
              ],
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
              isVisible: false,
              minimum: widget.minValue[0],
              maximum: widget.maxValue[0],
            ),
            series: data,
      
            onMarkerRender: (args) {
              if(args.pointIndex != null && chartData[args.pointIndex!].y != null) {
                if(chartData[args.pointIndex!].isAbnormal) {
                  args.color = AppColors.mainError;
                  args.borderColor = const Color.fromRGBO(254, 235, 240, 1);
                }
              }
            },
            margin: const EdgeInsets.symmetric(horizontal: 10),
            onChartTouchInteractionUp: (args) => context.read<PromptCubit>().unselect()
          ),
        ),
      );
    }

    return TapOutsideDetectorWidget(
      onTappedOutside: () => context.read<PromptCubit>().unselect(),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: SfCartesianChart(
          onPlotAreaSwipe: (ChartSwipeDirection direction) =>
            performSwipe(direction),
          margin: EdgeInsets.zero,
          plotAreaBorderWidth: 1,
          plotAreaBorderColor: AppColors.mainSeparatorAlpha,
          primaryXAxis: DateTimeAxis(
            plotBands: [
              if(widget.selected != null && seriesController != null) PlotBand(
                start: seriesController!.pixelToPoint(Offset(widget.selected!, 0)).x,
                end: seriesController!.pixelToPoint(Offset(widget.selected!, 0)).x,
                shouldRenderAboveSeries: false,
                borderWidth: 1,
                borderColor: Colors.grey.shade300,
                color: Colors.grey.shade300
              )
            ],
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
            minimum: widget.minValue[0],
            maximum: widget.maxValue[0],
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
            if(args.pointIndex != null && chartData[args.pointIndex!].y != null) {
    
              if(chartData[args.pointIndex!].isAbnormal) {
                args.color = AppColors.mainError;
                args.borderColor = const Color.fromRGBO(254, 235, 240, 1);
              }
            }
          },
    
          onChartTouchInteractionUp: (args) {
            // Заранее большое число
            double pixels = 10000;

            for (var el in chartData) { 
              final offset = seriesController!.pointToPixel(
                CartesianChartPoint(getXFromDate(el.x), el.y)
              );
              final dx = (offset.dx - args.position.dx).abs();
              if(dx < pixels) {
                pixels = dx;
              }
            }

            if(pixels > 15) {
              context.read<PromptCubit>().unselect();
            }
          }
        )
      ),
    );
  }
}

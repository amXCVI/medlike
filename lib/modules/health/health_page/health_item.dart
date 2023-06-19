import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/modules/health/diary_graph/diary_graph.dart';
import 'package:medlike/modules/health/diary_graph/diary_small_prompt.dart';
import 'package:medlike/modules/health/health_page/health_value.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/helpers/context_helper.dart';
import 'package:medlike/utils/helpers/grouping_helper.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:medlike/widgets/web_future_image/web_future_image.dart';

class HealthItem extends StatefulWidget {
  const HealthItem(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.measureItem,
      required this.decimalDigits,
      required this.minValue,
      required this.maxValue,
      required this.onLoadDada,
      required this.onNavigate,
      required this.firstDate,
      required this.lastDate,
      required this.index,
      required this.setSelected,
      this.data})
      : super(key: key);

  final String iconPath;
  final String title;
  final String measureItem;
  final int decimalDigits;
  final List<double> minValue;
  final List<double> maxValue;
  final DiaryFlatModel? data;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function onLoadDada;
  final Function onNavigate;
  final int index;
  final Function(bool) setSelected;

  @override
  State<HealthItem> createState() => _HealthItemState();
}

class _HealthItemState extends State<HealthItem> {
  Offset? offset;
  Offset? centerOffset;
  Offset? blockOffset;
  DataItem? item;
  final GlobalKey _widgetKey = GlobalKey();
  final GlobalKey _keyContext = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<DataItem> items = ValueHelper.filterItemsByPeriod(
        items: GroupingHelper.groupByDay(widget.data?.values ?? []),
        start: widget.firstDate,
        end: widget.lastDate);

    items = items.map((e) {
      return GroupingHelper.getByDay(e);
    }).toList();

    return BlocBuilder<PromptCubit, PromptState>(
      builder: (context, state) {
        final isPrompted = widget.index == state.selectedId &&
            state.promptStatuses == PromptStatuses.selected;

        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 8),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    //widget.onLoadDada('Hour', syn: widget.data!.syn);
                    //context.read<DiaryCubit>().onNavigate();
                    widget.onNavigate(widget.title, widget.data!.syn);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WebFutureImage(
                                    imageUrl: '${ApiConstants.baseUrl}${widget.iconPath}',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    widget.title,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                ]),
                            Flexible(
                              child: HealthValue(
                                  data: widget.data,
                                  measureItem: widget.measureItem,
                                  decimalDigits: widget.decimalDigits),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/ic_arrow_right_calendar.svg'),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DiaryGraph(
                                      key: _keyContext,
                                      items: items,
                                      firstDate: widget.firstDate,
                                      lastDate: widget.lastDate,
                                      measureItem: widget.measureItem,
                                      decimalDigits: widget.decimalDigits,
                                      minValue: widget.minValue,
                                      maxValue: widget.maxValue,
                                      selected: isPrompted ? offset?.dx : null,
                                      onSelect: (id, newOffset) {
                                        context
                                            .read<PromptCubit>()
                                            .select(selectedId: widget.index);

                                        final box = _keyContext.currentContext
                                            ?.findRenderObject() as RenderBox;
                                        final pos =
                                            box.localToGlobal(Offset.zero);

                                        Future.microtask(() {
                                          setState(() {
                                            item = items[id];
                                            offset = newOffset;
                                            blockOffset = newOffset;
                                            //widget.setSelected(true);
                                          });

                                          ContextHelper
                                              .getFutureSizeFromGlobalKey(
                                                  _widgetKey,
                                                  (size) => setState(() {
                                                        final dw = pos.dx;
                                                        var w = offset?.dx ??
                                                            0 - size.width / 2;
                                                        w = w < 0 ? 0 : w;
                                                        w = w > dw ? dw : w;
                                                        centerOffset = Offset(
                                                            w < 0 ? 0 : w,
                                                            size.height);

                                                        blockOffset = Offset(
                                                            offset!.dx +
                                                                        size
                                                                            .width <=
                                                                    dw
                                                                ? offset!.dx
                                                                : dw -
                                                                    size.width,
                                                            size.height);
                                                      }));
                                        });
                                      },
                                      onUnselect: () {
                                        setState(() {
                                          item = null;
                                          offset = null;

                                          /// TODO: отрефакторить Health и Diary
                                          //widget.setSelected(false);
                                          context
                                              .read<PromptCubit>()
                                              .unselect();
                                        });
                                      },
                                      grouping: 'Week',
                                      isClean: true,
                                    ),
                                  ],
                                ),
                              ),
                              if (isPrompted)
                                Positioned(
                                  top: 5,
                                  left: blockOffset?.dx,
                                  child: DiarySmallPrompt(
                                    key: _widgetKey,
                                    item: item!,
                                    decimalDigits: widget.decimalDigits,
                                  ),
                                ),
                              if (isPrompted)
                                Positioned(
                                    left: (centerOffset?.dx ?? blockOffset?.dx),
                                    top: 12,
                                    child: Container(
                                      height: 5,
                                      width: 1,
                                      color: AppColors.mainSeparatorAlpha,
                                    ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}

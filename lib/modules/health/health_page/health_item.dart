import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/diary_graph/diary_graph.dart';
import 'package:medlike/modules/health/diary_graph/diary_small_prompt.dart';
import 'package:medlike/modules/health/health_page/health_value.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/helpers/context_helper.dart';


class HealthItem extends StatefulWidget {
  const HealthItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.measureItem,
    required this.decimalDigits,
    required this.onLoadDada,
    required this.onNavigate,
    required this.firstDate,
    required this.lastDate,
    this.data
  }) : super(key: key);

  final String iconPath;
  final String title;
  final String measureItem;
  final int decimalDigits;
  final DiaryModel? data;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function onLoadDada;
  final Function onNavigate;

  @override
  State<HealthItem> createState() => _HealthItemState();
}

class _HealthItemState extends State<HealthItem> {
  Offset offset = const Offset(0, 0);
  Offset? centerOffset;
  DiaryItem? item;
  final GlobalKey _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
        child:
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: ()  {
                widget.onLoadDada('Hour', syn: widget.data!.syn);
                widget.onNavigate(widget.title, widget.data!.syn);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              Image.network(
                                '${ApiConstants.baseUrl}${widget.iconPath}',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            ]
                          ),
                        ),
                        HealthValue(
                          data: widget.data,
                          measureItem: widget.measureItem,
                          decimalDigits: widget.decimalDigits
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          SvgPicture.asset('assets/icons/ic_arrow_right_calendar.svg'),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 65,
                                  child: DiaryGraph(
                                    items: widget.data?.values ?? [], 
                                    firstDate: widget.firstDate, 
                                    lastDate: widget.lastDate, 
                                    measureItem: widget.measureItem, 
                                    decimalDigits: widget.decimalDigits,
                                    selected: offset.dx, 
                                    onSelect: (id, newOffset) {
                                      Future.microtask(
                                        () {
                                          setState(() {
                                            item = widget.data?.values[id];
                                            offset = newOffset;
                                          });
                          
                                          ContextHelper.getFutureSizeFromGlobalKey(
                                            _widgetKey, 
                                            (size) => setState(() {
                                              final dw = MediaQuery.of(context).size.width;
                                              var w = offset.dx - size.width / 2;
                                              w = w < 0 ? 0 : w;
                                              w = w > dw ? dw : w;
                                              centerOffset = Offset(
                                                w < 0 ? 0 : w,
                                                size.height
                                              );
                                            }) 
                                          );
                                        }
                                      );
                                    },
                                    onUnselect: () {
                                      setState(() {
                                        item = null;
                                        offset = const Offset(0, 0);
                                      });
                                    },
                                    grouping: 'Week',
                                    isClean: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if(item != null) Positioned(
                            top: 10,
                            left: centerOffset?.dx ?? offset.dx,
                            child: DiarySmallPrompt(
                              key: _widgetKey,
                              item: item!, 
                              decimalDigits: widget.decimalDigits, 
                            ),
                          ),
                          Positioned(
                            left: offset.dx - 1,
                            top: 32,
                            child: Container(
                              height: 5,
                              width: 1,
                              color: AppColors.mainSeparatorAlpha,
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
      ),
    );
  }
}

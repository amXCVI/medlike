import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/diary_graph/diary_graph.dart';
import 'package:medlike/modules/health/health_page/health_value.dart';
import 'package:medlike/utils/api/api_constants.dart';


class HealthItem extends StatelessWidget {
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
                onLoadDada('Hour', syn: data!.syn);
                onNavigate(title);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              Image.network(
                                '${ApiConstants.baseUrl}$iconPath',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                title,
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            ]
                          ),
                        ),
                        SvgPicture.asset('assets/icons/ic_arrow_right_calendar.svg')
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HealthValue(
                            data: data,
                            measureItem: measureItem,
                            decimalDigits: decimalDigits
                          ),
                          Expanded(
                            child: DiaryGraph(
                              items: data?.values ?? [], 
                              firstDate: firstDate, 
                              lastDate: lastDate, 
                              measureItem: measureItem, 
                              decimalDigits: decimalDigits, 
                              onSelect: (id) {
                                /// TODO: DiaryPrompt
                              },
                              grouping: 'Week',
                              isClean: true,
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

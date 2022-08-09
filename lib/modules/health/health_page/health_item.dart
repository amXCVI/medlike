import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/health_page/health_graph.dart';
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
    this.data
  }) : super(key: key);

  final String iconPath;
  final String title;
  final String measureItem;
  final int decimalDigits;
  final DiaryModel? data;
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
            child: Ink(
              child: SizedBox(
                //padding: const EdgeInsets.only(bottom: 15),
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
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
                          IconButton(
                            icon: SvgPicture.asset('assets/icons/ic_arrow_right_calendar.svg'),
                            onPressed: () {
                              onLoadDada('Hour', syn: data!.syn);
                              onNavigate(title);
                            },
                          ),
                        ],
                      ),
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
                            child: HealthGraph(
                              data: data == null ? null : data!.values
                            ),
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

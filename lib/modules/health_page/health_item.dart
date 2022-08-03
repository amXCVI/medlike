import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/modules/health_page/health_graph.dart';
import 'package:medlike/modules/health_page/health_value.dart';
import 'package:medlike/utils/api/api_constants.dart';


class HealthItem extends StatelessWidget {
  const HealthItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.data
  }) : super(key: key);

  final String iconPath;
  final String title;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Ink(
        child: SizedBox(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        Image.network('${ApiConstants.baseUrl}$iconPath'),
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
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  HealthValue(
                    data: data
                  ),
                  HealthGraph(
                    data: data
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}

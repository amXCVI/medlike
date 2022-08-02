import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HealthItem extends StatelessWidget {
  const HealthItem({
    Key? key,
    required this.iconPath,
    required this.title
  }) : super(key: key);

  final String iconPath;
  final String title;

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
                        SvgPicture.asset(iconPath),
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
                  Column(),
                  Column()
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}

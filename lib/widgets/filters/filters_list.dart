import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class FiltersList extends StatelessWidget {
  const FiltersList(
      {Key? key,
      required this.filterTitles,
      required this.values,
      required this.images,
      required this.onChecked})
      : super(key: key);

  final List<String> filterTitles;
  final List<bool> values;
  final List<Widget> images;
  final Function(int, bool?) onChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondBackground,
      height: values.length * 72 + 20,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          separatorBuilder: (context, index) => const Divider(
                color: Color.fromRGBO(158, 157, 157, 0.4),
              ),
          itemCount: filterTitles.length,
          itemBuilder: ((context, i) {
            return ListTile(
              title: Text(filterTitles[i]),
              leading: SizedBox(
                width: 20, 
                height: 20,
                child: images[i],
              ),
              trailing: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: values[i]
                          ? Theme.of(context).primaryColor
                          : const Color.fromRGBO(151, 151, 151, 1),
                    ),
                    borderRadius: BorderRadius.circular(4)),
                child: Checkbox(
                    activeColor: values[i]
                        ? Theme.of(context).primaryColor
                        : const Color.fromRGBO(151, 151, 151, 1),
                    checkColor: values[i]
                        ? Theme.of(context).primaryColor
                        : const Color.fromRGBO(151, 151, 151, 1),
                    fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      return Colors.transparent;
                    }),
                    value: values[i],
                    onChanged: (newValue) => onChecked(i, newValue)),
              ),
            );
          })),
    );
  }
}

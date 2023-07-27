import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class DropdownButtonWidget extends StatelessWidget {
  const DropdownButtonWidget(
      {Key? key,
      required this.itemsList,
      required this.value,
      required this.onChanged})
      : super(key: key);

  final List<String> itemsList;
  final String value;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: Theme.of(context).textTheme.labelLarge,
      isExpanded: true,
      underline: Container(
        height: 8,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.mainText),
          ),
        ),
      ),
      value: value,
      icon: SvgPicture.asset(
        'assets/icons/appointments/trailing_icon.svg',
      ),
      items: itemsList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        onChanged(newValue!);
      },
    );
  }
}

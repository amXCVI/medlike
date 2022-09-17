import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.5),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.check,
            size: 16,
            color: value ? Theme.of(context).primaryColor : Colors.white,
          )),
    );
  }
}

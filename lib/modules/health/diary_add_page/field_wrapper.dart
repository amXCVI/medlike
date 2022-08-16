import 'package:flutter/material.dart';

class FieldWrapper extends StatelessWidget {
  const FieldWrapper({
    Key? key,
    required this.labelText,
    required this.child
  }) : super(key: key);

  final String labelText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: Theme.of(context).textTheme.labelMedium),
          child
        ],
      ),
    );
  }
}

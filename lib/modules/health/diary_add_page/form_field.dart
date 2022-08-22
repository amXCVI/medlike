import 'package:flutter/material.dart';
import 'package:medlike/modules/health/diary_add_page/field_wrapper.dart';

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.onChange
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      labelText: labelText,
      child: TextField(
        controller: controller,
        onChanged: (text) => onChange(text),
        autofocus: false,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.labelLarge,
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class FieldWrapper extends StatelessWidget {
  const FieldWrapper(
      {Key? key,
      required this.labelText,
      required this.onTap,
      required this.onChange,
      required this.isEmpty,
      required this.controller,
      this.validator})
      : super(key: key);

  final String labelText;
  final VoidCallback onTap;
  final Function onChange;
  final bool isEmpty;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextFormField(
        onChanged: (text) {
          controller.text = text;
          onChange(text);
        },
        keyboardType: TextInputType.number,
        readOnly: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              color: AppColors.lightText,
              fontSize: 17,
              fontWeight: FontWeight.w300),
          errorStyle: const TextStyle(
              color: AppColors.mainError,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(top: 4),
          floatingLabelStyle: TextStyle(
              color: isEmpty ? AppColors.lightText : AppColors.mainText,
              fontWeight: FontWeight.w300),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainText)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainText)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainError)),
        ),
        autofocus: false,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        style: const TextStyle(color: AppColors.mainText, fontSize: 16),
        onTap: onTap,
        validator: validator,
      ),
    );
  }
}

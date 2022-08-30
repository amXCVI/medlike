import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

/// TODO: слить с form field
class FieldWrapper extends StatelessWidget {
  const FieldWrapper({
    Key? key,
    required this.labelText,
    required this.onTap,
    required this.onChange,
    required this.isEmpty,
    required this.controller,
    //required this.validator
  }) : super(key: key);

  final String labelText;
  final VoidCallback onTap;
  final Function onChange;
  final bool isEmpty;
  final TextEditingController controller;
  //final String? Function(String?) validator;

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
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.lightText,
            fontSize: 17,
            fontWeight: FontWeight.w300
          ),
          errorStyle: const TextStyle(
            color: AppColors.mainError,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          contentPadding: const EdgeInsets.only(top: 4),
          floatingLabelStyle: TextStyle(
            color: isEmpty ? AppColors.lightText : AppColors.mainText, 
            fontSize: 21,
            fontWeight: FontWeight.w300
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isEmpty ? AppColors.lightText : AppColors.mainText
            )
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.mainText
            )
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.mainError
            )
          ),
        ),
        autofocus: false,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        style: const TextStyle(
          color: AppColors.mainText,
          fontSize: 16
        ),
        onTap: onTap,
      ),
    );
  }
}

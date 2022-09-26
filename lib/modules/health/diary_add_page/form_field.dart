import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/themes/colors.dart';

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.onChange,
    required this.isEmpty,
    required this.validator
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final Function onChange;
  final bool isEmpty;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextFormField(
        controller: controller,
        onChanged: (text) => onChange(text),
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
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
        validator: validator,
      ),
    );
  }
}

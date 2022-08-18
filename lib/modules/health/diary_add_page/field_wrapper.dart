import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

/// TODO: слить с form field
class FieldWrapper extends StatelessWidget {
  FieldWrapper({
    Key? key,
    required this.labelText,
    required this.onTap,
    required this.onChange,
    required this.isEmpty,
    this.initialValue
    //required this.validator
  }) : super(key: key);

  final String labelText;
  final VoidCallback onTap;
  final Function onChange;
  final String? initialValue;
  final bool isEmpty;
  final TextEditingController dateTimeController = TextEditingController();
  //final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextFormField(
        onChanged: (text) {
          dateTimeController.text = text; 
          onChange(text);
        },
        keyboardType: TextInputType.number,
        initialValue: initialValue,
        controller: dateTimeController,
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
          floatingLabelStyle: const TextStyle(
            color: AppColors.lightText, 
            fontSize: 22,
            fontWeight: FontWeight.w300
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isEmpty ? AppColors.mainSeparatorAlpha : AppColors.mainText
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

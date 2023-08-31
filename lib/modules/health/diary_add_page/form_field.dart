import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/themes/colors.dart';

class FormField extends StatefulWidget {
  const FormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.onChange,
    required this.isEmpty,
    required this.onFocus,
    required this.isValidate,
    required this.decimalDigits,
    required this.validator
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final Function onChange;
  final bool isEmpty;
  final Function onFocus;
  final bool isValidate;
  final int decimalDigits;
  final String? Function(String?) validator;

  @override
  State<FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  final FocusNode _node = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Focus(
        focusNode: _node,
        onFocusChange: (status) {
          if(status == true) {
            widget.onFocus();
          }
        },
        child: TextFormField(
          controller: widget.controller,
          onChanged: (text) => widget.onChange(text),
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.always,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              widget.decimalDigits == 0 
                ? RegExp('^\\d+') 
                : RegExp('^\\d+\\.?\\d{0,${widget.decimalDigits}}')
            ),
          ],
          decoration: InputDecoration(
            labelText: widget.labelText,
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
              color: widget.isEmpty ? AppColors.lightText : AppColors.mainText, 
              fontWeight: FontWeight.w300
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.isEmpty ? AppColors.mainSeparatorAlpha : AppColors.mainText
              )
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.controller.text == "" ? AppColors.mainSeparatorAlpha : AppColors.mainText
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
          validator: widget.validator,
        ),
      ),
    );
  }
}

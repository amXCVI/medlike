import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';
import 'package:tap_canvas/tap_canvas.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    Key? key,
    required this.focus,
    this.error,
    required this.controller,
    required this.onChangePhone,
  }) : super(key: key);

  final FocusNode focus;
  final String? error;
  final TextEditingController controller;
  final void Function(String) onChangePhone;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  void _onUnFocus() {
    widget.focus.unfocus();
    if (widget.controller.text.length == 2) {
      setState(() {
        widget.controller.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ваш телефон', style: Theme.of(context).textTheme.labelMedium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TapOutsideDetectorWidget(
            onTappedOutside: _onUnFocus,
            // onTappedInside: _onFocus,
            child: TextField(
              key: const ValueKey('number_field'),
              controller: widget.controller,
              onChanged: (text) => widget.onChangePhone(text),
              autofocus: false,
              keyboardType: TextInputType.phone,
              inputFormatters: [phoneMaskFormatter],
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: widget.error == null
                      ? const BorderSide(color: AppColors.lightText, width: 1.0)
                      : const BorderSide(
                          color: AppColors.mainError, width: 1.0),
                ),
                hintText: '+7 (XXX) XXX XX XX',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
              ),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
              cursorColor: AppColors.mainText,
              // onSubmitted: (value) {
              //   _savePhoneNumber(value);
              // },
              enableSuggestions: false,
              autocorrect: false,
              focusNode: widget.focus,
            ),
          ),
        ),
        if (widget.error != null)
          Text(
            widget.error!,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppColors.mainError),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 32),
      ],
    );
  }
}

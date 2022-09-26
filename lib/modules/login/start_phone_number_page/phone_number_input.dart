import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';
import 'package:tap_canvas/tap_canvas.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({Key? key}) : super(key: key);

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final FocusNode _focus = FocusNode();

  late final TextEditingController _controller =
      TextEditingController(text: '');

  void _onChangePhone(String text) {
    RegExp exp = RegExp(r"[^0-9]+");
    if (_controller.text.replaceAll(exp, '').length == 11) {
      _focus.unfocus();
      _savePhoneNumber(_controller.text);
      setState(() {
        _controller.value = const TextEditingValue(text: '');
      });
    }
  }

  void _savePhoneNumber(String phone) {
    RegExp exp = RegExp(r"[^0-9]+");
    String phoneString = phone.replaceAll(exp, '');
    if (phoneString.length != 11) {
      return;
    }

    context.read<UserCubit>().checkUserAccount(phoneNumber: phoneString);

    context.read<UserCubit>().tempSavePhoneNumber(phoneString);
    dispose();
  }

  void _onUnFocus() {
    _focus.unfocus();
    if (_controller.text.length == 2) {
      setState(() {
        _controller.text = '';
      });
    }
  }

  void _onFocus() {
    if (_controller.text.isEmpty) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _controller.text = '+7';
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Введите номер телефона',
            style: Theme.of(context).textTheme.labelMedium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TapOutsideDetectorWidget(
            onTappedOutside: _onUnFocus,
            onTappedInside: _onFocus,
            child: TextField(
              key: UniqueKey(),
              controller: _controller,
              onChanged: (text) => _onChangePhone(text),
              autofocus: false,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                phoneMaskFormatter
              ],
              decoration: InputDecoration(
                hintText: '+7 (XXX) XXX XX XX',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
              ),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
              cursorColor: AppColors.mainText,
              onSubmitted: (value) {
                _savePhoneNumber(value);
              },
              enableSuggestions: false,
              autocorrect: false,
              focusNode: _focus,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

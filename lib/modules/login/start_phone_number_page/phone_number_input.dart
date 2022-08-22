import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';

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
    if (_controller.text.replaceAll(exp, '').length >= 11) {
      _focus.unfocus();
      _savePhoneNumber(_controller.text);
      setState(() {
        _controller.text = '';
      });
    }
  }

  void _savePhoneNumber(String phone) {
    RegExp exp = RegExp(r"[^0-9]+");
    String phoneString = phone.replaceAll(exp, '');
    context.read<UserCubit>().savePhoneNumber(phoneString);
    context.router.push(PasswordRoute(phoneNumber: phoneString));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Введите номер телефона',
            style: Theme.of(context).textTheme.labelMedium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
            controller: _controller,
            onChanged: (text) => _onChangePhone(text),
            autofocus: false,
            keyboardType: TextInputType.phone,
            inputFormatters: [phoneMaskFormatter],
            decoration: InputDecoration(
              hintText: '+7 (###) ###-##-##',
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
          ),
        ),
      ],
    );
  }
}

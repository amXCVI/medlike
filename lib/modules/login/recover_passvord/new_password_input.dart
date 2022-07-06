import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';

class NewPasswordInput extends StatefulWidget {
  const NewPasswordInput({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<NewPasswordInput> createState() => _NewPasswordInputState();
}

class _NewPasswordInputState extends State<NewPasswordInput> {
  late final TextEditingController _phoneInputController =
      TextEditingController()..text = '';
  late TextEditingController _codeInputController = TextEditingController()
    ..text = '';

  bool _isObscure = false;
  late int _step = 0;
  late String _password = '';
  late String _confirmPassword = '';

  void _handleSubmittedPassword(String value) {
    if (_step == 0) {
      setState(() {
        _password = value;
        _step = 1;
        _codeInputController = TextEditingController()..text = '';
      });
    } else {
      setState(() {
        _confirmPassword = value;
      });
      RegExp exp = RegExp(r"[^0-9]+");
      String phoneString = _phoneInputController.text.replaceAll(exp, '');
      context.read<UserCubit>().resetPassword(
            phoneNumber: phoneString,
            smsToken: widget.token,
            password: _password,
            confirmPassword: _confirmPassword,
          );
    }
  }

  void sendSmsToken(String smsToken) {
    RegExp exp = RegExp(r"[^0-9]+");
    String phoneString = _phoneInputController.text.replaceAll(exp, '');
    context
        .read<UserCubit>()
        .sendResetPasswordCode(phoneNumber: phoneString, smsToken: smsToken);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.userPhoneNumber != null &&
            state.userPhoneNumber!.isNotEmpty) {
          _phoneInputController.text = phoneMaskFormatter
              .maskText(state.userPhoneNumber!.replaceAll(RegExp("[+7]"), ''));
        } else {
          context.router.push(const PhoneNumberRoute());
        }

        if (state.resetPasswordStatus == ResetPasswordStatuses.success) {
          context.router.push(const CreatePinCodeRoute());
        }

        return Column(
          children: [
            TextField(
              controller: _phoneInputController,
              autofocus: false,
              keyboardType: TextInputType.number,
              inputFormatters: [phoneMaskFormatter],
              decoration: InputDecoration(
                hintText: '+7 (###) ###-##-##',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: AppColors.lightText),
              textAlign: TextAlign.center,
              showCursor: false,
              readOnly: true,
            ),
            const SizedBox(height: 12),
            Text(_step == 0 ? 'Придумайте пароль' : 'Повторите пароль',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w300)),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _codeInputController,
                autofocus: false,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(_isObscure
                        ? 'assets/icons/login/show_password_symbols.svg'
                        : 'assets/icons/login/not_show_password_symbols.svg'),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  prefixIcon: const SizedBox(width: 40),
                ),
                style: Theme.of(context).textTheme.labelLarge,
                obscureText: _isObscure,
                enableSuggestions: false,
                autocorrect: false,
                textAlign: TextAlign.center,
                showCursor: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  _handleSubmittedPassword(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

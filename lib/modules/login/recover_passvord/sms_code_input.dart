import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';

class SmsCodeInput extends StatefulWidget {
  const SmsCodeInput({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<SmsCodeInput> createState() => _SmsCodeInputState();
}

class _SmsCodeInputState extends State<SmsCodeInput> {
  late final TextEditingController _phoneInputController =
      TextEditingController()
        ..text = phoneMaskFormatter
            .maskText(widget.phoneNumber.replaceFirst(RegExp("[7]"), ''));
  late final TextEditingController _codeInputController =
      TextEditingController()..text = '';

  void getNewSmsCode() {
    String phoneString = widget.phoneNumber;
    context
        .read<UserCubit>()
        .getNewSmsForRecoverPassword(phoneNumber: phoneString);
  }

  void sendSmsToken(String smsToken) async {
    String phoneString = widget.phoneNumber;
    bool response = await context
        .read<UserCubit>()
        .sendResetPasswordCode(phoneNumber: phoneString, smsToken: smsToken);
    if (response) {
      context.router.push(RecoverPasswordNewRoute(smsToken: smsToken));
    }
  }

  @override
  Widget build(BuildContext context) {
    getNewSmsCode();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.userPhoneNumber != null &&
            state.userPhoneNumber!.isNotEmpty) {
          _phoneInputController.text = phoneMaskFormatter
              .maskText(state.userPhoneNumber!.replaceAll(RegExp("[+7]"), ''));
        } else {
          context.router.push(PhoneNumberRoute());
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
            Text('Введите код из SMS',
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                        'assets/icons/login/trailing_password_icon.svg'),
                    onPressed: () {
                      getNewSmsCode();
                    },
                  ),
                  prefixIcon: const SizedBox(width: 40),
                ),
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
                showCursor: true,
                onSubmitted: (value) {
                  sendSmsToken(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

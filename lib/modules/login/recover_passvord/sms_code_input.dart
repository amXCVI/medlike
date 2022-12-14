import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';
import 'package:tap_canvas/tap_canvas.dart';

class SmsCodeInput extends StatefulWidget {
  const SmsCodeInput({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<SmsCodeInput> createState() => _SmsCodeInputState();
}

class _SmsCodeInputState extends State<SmsCodeInput> {
  late final TextEditingController _phoneInputController =
      TextEditingController()
        ..text = phoneMaskFormatter.maskText(widget.phoneNumber.substring(1));
  late final TextEditingController _codeInputController =
      TextEditingController()..text = '';

  String? errorMsg;

  void getNewSmsCode() {
    String phoneString = widget.phoneNumber;
    context
        .read<UserCubit>()
        .getNewSmsForRecoverPassword(phoneNumber: phoneString);
  }

  void sendSmsToken(String smsToken) async {
    String phoneString = widget.phoneNumber;
    final response = await context
        .read<UserCubit>()
        .sendResetPasswordCode(phoneNumber: phoneString, smsToken: smsToken);
    if (response == null) {
      context.router.push(RecoverPasswordNewRoute(smsToken: smsToken));
    } else {
      setState(() {
        errorMsg = response.message;
      });
    }
  }

  void _onFocus() {
    if (errorMsg != null) {
      setState(() {
        errorMsg = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getNewSmsCode();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        print('!!!!!!!!!!!');
        print(widget.phoneNumber);

        return Column(
          children: [
            TapOutsideDetectorWidget(
              onTappedOutside: () {},
              onTappedInside: _onFocus,
              child: TextField(
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
                  enabledBorder: UnderlineInputBorder(
                    borderSide: errorMsg == null
                        ? const BorderSide(
                            color: AppColors.lightText, width: 1.0)
                        : const BorderSide(
                            color: AppColors.mainError, width: 1.0),
                  ),
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
            if (errorMsg != null)
              Text(
                errorMsg!,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.mainError),
                textAlign: TextAlign.center,
              ),
          ],
        );
      },
    );
  }
}

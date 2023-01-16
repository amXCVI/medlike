import 'dart:async';

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
  const SmsCodeInput({
    Key? key, 
    required this.phoneNumber,
    required this.time
  }) : super(key: key);

  final String phoneNumber;
  final int time;

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
  String? timerMsg;
  Timer? timer;
  int time = 0;

  @override
  void initState() {
    time = widget.time;
    if(time > 0) {
      final dur = Duration(
        seconds: time
      );
      timerMsg = _printDuration(dur);
      _startTimer(time);
    } else {
      getNewSmsCode();
    }

    super.initState();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  int? _parseSeconds(String message) {
    final numeric = RegExp(r'[0-9]+');
    final match = numeric.firstMatch(message);
    final matchedText = match?.group(0);
    return int.tryParse(matchedText ?? '');
  }

  void _startTimer(int? start) {
    setState(() {
      time = start ?? 5 * 60;

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          final dur = Duration(
            seconds: time
          );
          timerMsg = _printDuration(dur);
          time--;
          context.read<UserCubit>().setTimer(time);
          if(time <= 0) {
            timer.cancel();
            timerMsg = null;
          }
        });
      });
    });
  }

  Future<bool> getNewSmsCode() async {
    String phoneString = widget.phoneNumber;
    final response = await context
        .read<UserCubit>()
        .getNewSmsForRecoverPassword(phoneNumber: phoneString);

    if(response != null) {
      setState(() {
        errorMsg = null;
        _startTimer(_parseSeconds(response.message ?? ''));
      });
      return false;
    }
    return true;
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
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                    icon: time <= 0 ? SvgPicture.asset(
                        'assets/icons/login/trailing_password_icon.svg')
                      : SvgPicture.asset(
                        'assets/icons/login/trailing_password_disabled.svg'),
                    onPressed: () {
                      if(time <= 0) {
                        getNewSmsCode();
                      }
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
            if (timerMsg != null)
              RichText(
                text: TextSpan(
                  text: 'Запросить код повторно можно через ',
                  style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.lightText),
                  children: [
                    TextSpan(
                      text: timerMsg,
                      style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.mainText),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
          ],
        );
      },
    );
  }
}

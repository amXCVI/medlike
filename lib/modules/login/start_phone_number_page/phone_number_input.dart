import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';
import 'package:tap_canvas/tap_canvas.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final FocusNode _focus = FocusNode();
  String? error;

  late final TextEditingController _controller =
      TextEditingController(text: '');

  void _onChangePhone(String text) {
    RegExp exp = RegExp(r"[^0-9]+");
    if (_controller.text.replaceAll(exp, '').length == 11) {
      _focus.unfocus();
      _savePhoneNumber(_controller.text);
    }
  }

  void _savePhoneNumber(String phone) async {
    RegExp exp = RegExp(r"[^0-9]+");
    String phoneString = phone.replaceAll(exp, '');
    if (phoneString.length != 11) {
      setState(() {
        error = 'Номер телефона имеет некорректную длину';
      });
      return;
    }

    final response = await context.read<UserCubit>().checkUserAccount(
      phoneNumber: phoneString
    );

    if(response.message != null) {
      setState(() {
        error = response.message;
      });
    }

    context.read<UserCubit>().tempSavePhoneNumber(phoneString);
    //dispose();
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
    if(error != null) {
      setState(() {
        error = null;
      });
      _focus.nextFocus();
    }

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
    return BlocListener<UserCubit, UserState>(
      listenWhen: (prev, cur) {
        return prev.checkUserAccountStatus != cur.checkUserAccountStatus;
      },
      listener: (context, state) {
        if(state.checkUserAccountStatus == CheckUserAccountStatuses.failed
          || state.checkUserAccountStatus == CheckUserAccountStatuses.continued
        ) {
          if (!mounted) {
            return;
          }
          setState(() {
            phoneMaskFormatter.clear();
            _controller.text = '';
          });
        }
      },
      child: Column(
        children: [
          Text('Введите номер телефона',
              style: Theme.of(context).textTheme.labelMedium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TapOutsideDetectorWidget(
              onTappedOutside: _onUnFocus,
              onTappedInside: _onFocus,
              child: TextField(
                key: const ValueKey('number_field'),
                controller: _controller,
                onChanged: (text) => _onChangePhone(text),
                autofocus: false,
                keyboardType: TextInputType.phone,
                inputFormatters: [phoneMaskFormatter],
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: error == null 
                      ? const BorderSide(color: AppColors.lightText, width: 1.0)
                      : const BorderSide(color: AppColors.mainError, width: 1.0),
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
                onSubmitted: (value) {
                  _savePhoneNumber(value);
                },
                enableSuggestions: false,
                autocorrect: false,
                focusNode: _focus,
              ),
            ),
          ),
          if(error != null) Text(
            error!,
            style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.mainError),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

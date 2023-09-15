import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:tap_canvas/tap_canvas.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    required this.errorReset,
    this.errorMsg,
    required this.focus,
    required this.controller,
    this.onSubmitted,
    required this.onChangePassword,
  }) : super(key: key);

  final String? errorMsg;
  final VoidCallback errorReset;
  final FocusNode focus;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final void Function(String) onChangePassword;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    widget.focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focus.removeListener(_onFocusChange);
    widget.focus.dispose();
  }

  void _onFocusChange() {
    widget.errorReset();
  }

  void _onFocus() {
    if (widget.errorMsg != null) {
      widget.errorReset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Введите пароль', style: Theme.of(context).textTheme.labelMedium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            child: TapOutsideDetectorWidget(
              onTappedOutside: () {},
              onTappedInside: _onFocus,
              child: TextField(
                controller: widget.controller,
                onChanged: (text) => widget.onChangePassword(text),
                focusNode: widget.focus,
                autofocus: false,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: widget.errorMsg == null
                        ? const BorderSide(
                            color: AppColors.lightText, width: 1.0)
                        : const BorderSide(
                            color: AppColors.mainError, width: 1.0),
                  ),
                  hintText: '********',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.lightText),
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
                obscureText: _isObscure,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                onSubmitted: widget.onSubmitted,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        if (widget.errorMsg != null)
          Text(
            widget.errorMsg!,
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

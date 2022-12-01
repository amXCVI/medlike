import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:tap_canvas/tap_canvas.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key, 
    required this.phoneNumber, 
    required this.onAuth,
    required this.errorReset,
    this.errorMsg
  }): super(key: key);

  final String phoneNumber;
  final String? errorMsg; 
  final VoidCallback errorReset;
  final void Function({required String password}) onAuth;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final FocusNode _focus = FocusNode();
  late final TextEditingController _controller = TextEditingController()
    ..text = '';
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    widget.errorReset();
  }

  void _onChangePassword(String text) {}

  void _authenticateWithPhoneAndPassword() {
    widget.onAuth(password: _controller.text);
  }

  void _onFocus() {
    if(widget.errorMsg != null) {
      setState(() {
        widget.errorReset();
      });
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
                controller: _controller,
                onChanged: (text) => _onChangePassword(text),
                focusNode: _focus,
                autofocus: false,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: widget.errorMsg == null 
                      ? const BorderSide(color: AppColors.lightText, width: 1.0)
                      : const BorderSide(color: AppColors.mainError, width: 1.0),
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
                onSubmitted: (value) {
                  _authenticateWithPhoneAndPassword();
                },
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        if(widget.errorMsg != null) Text(
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

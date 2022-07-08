import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final FocusNode _focus = FocusNode();
  late final TextEditingController _controller = TextEditingController()
    ..text = '';
  bool _isObscure = false;

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

  void _onFocusChange() {}

  void _onChangePassword(String text) {}

  void _authenticateWithPhoneAndPassword() {
    context.read<UserCubit>().handleSubmitPassword(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Введите пароль', style: Theme.of(context).textTheme.labelMedium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            child: TextField(
              controller: _controller,
              onChanged: (text) => _onChangePassword(text),
              focusNode: _focus,
              autofocus: false,
              decoration: InputDecoration(
                hintText: '********',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).dividerColor,
                  ),
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
      ],
    );
  }
}

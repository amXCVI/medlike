import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/modules/app/bloc/user_bloc.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';
import 'package:medlike/widgets/app_bar/unauth_app_bar/unauth_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginPhoneFormKey = GlobalKey<FormState>();
  final FocusNode _focus = FocusNode();
  late final TextEditingController _controller = TextEditingController()
    ..text = '';

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
    if (_focus.hasFocus && _controller.text.isEmpty) {
      _controller.text = '+7';
    }
  }

  void _onChangePhone(String text) {
    RegExp exp = RegExp(r"[^0-9]+");
    if (_controller.text.replaceAll(exp, '').length >= 11) {
      _focus.unfocus();
      _authenticateWithPhoneAndPassword();
    }
  }

  void _authenticateWithPhoneAndPassword() {
      BlocProvider.of<UserBloc>(context).add(
        SignInWithPasswordRequested(_controller.text, ''),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const UnAuthAppBar(title: 'Заполярье'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 0, top: 6, right: 0, bottom: 0),
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        left: 0, top: 6, right: 0, bottom: 35),
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Lottie.asset(
                          'assets/animations/onboarding_animation.json'),
                    )),
              ]),
              Text('Введите номер телефона',
                  style: Theme.of(context).textTheme.bodySmall),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _loginPhoneFormKey,
                  child: TextField(
                    controller: _controller,
                    onChanged: (text) => _onChangePhone(text),
                    focusNode: _focus,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [phoneMaskFormatter],
                    decoration: const InputDecoration(
                      hintText: '+7 (###) ###-##-##',
                      hintStyle: TextStyle(fontSize: 17, color: lightText),
                    ),
                    style: const TextStyle(
                      fontSize: 17,
                      color: mainText,
                    ),
                    textAlign: TextAlign.center,
                    showCursor: _focus.hasFocus && _controller.text.isNotEmpty
                        ? true
                        : false,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
          child: TextButton(
            onPressed: () {},
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Используя приложение, вы принимаете условия ',
                style: TextStyle(fontSize: 14, color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                      text: 'пользовательского соглашения',
                      style: TextStyle(color: mainBrandColor)),
                ],
              ),
            ),
          ),
        ));
  }
}

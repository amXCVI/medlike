import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/modules/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/validators/phone_validator.dart';
import 'package:medlike/widgets/app_bar/unauth_app_bar/unauth_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const UnAuthAppBar(title: 'Заполярье'),
      body: BlocProvider(
        create: (context) => UserCubit(UserRepository()),
        child: const LoginPageWidget(),
      ),
      bottomNavigationBar: const LoginPageBottomNavigationBar(),
    );
  }
}

class LoginPageBottomNavigationBar extends StatelessWidget {
  const LoginPageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
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
    );
  }
}

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final GlobalKey<FormState> _loginPhoneFormKey = GlobalKey<FormState>();
  final FocusNode _focus = FocusNode();
  late final TextEditingController _controller = TextEditingController()
    ..text = '';
  final userRepository = UserRepository();

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
      _authenticateWithPhoneAndPassword(_controller.text);
    }
  }

  void _authenticateWithPhoneAndPassword(String phone) {
    RegExp exp = RegExp(r"[^0-9]+");
    String phoneString = phone.replaceAll(exp, '');
    UserCubit(UserRepository()).loginWithPassword(phoneString, 'Qwerty11@');
    // UserBloc(userRepository: UserRepository()).add(
    //   LoginWithPasswordRequestedEvent(phoneString, 'Qwerty11@'),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(userRepository),
      child: Material(
        child: SingleChildScrollView(
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
                    keyboardType: TextInputType.phone,
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
              // state is UserLoginLoadedState
              //     ? Text(state.authTokens.token)
              //     : MaterialButton(
              //         onPressed: () =>
              //             _authenticateWithPhoneAndPassword(_controller.text),
              //         child: Text('Load'),
              //       ),
              BlocBuilder<UserCubit, UserAuthState>(
                builder: (context, state) {
                  return MaterialButton(
                    onPressed: () =>
                        _authenticateWithPhoneAndPassword(_controller.text),
                    child: Text('Login '),
                  );
                },
              ),
              Results(),
            ],
          ),
        ),
      ),
    );
  }
}

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = context.watch<UserCubit>();
    // return BlocBuilder<UserCubit, UserAuthState>(builder: (context, state) {
      switch (userCubit.state.status) {
        case UserAuthStatuses.unAuth:
          return Text('Unauth');

        case UserAuthStatuses.successAuth:
          return Text('!!!SUCCESS!!!');

        case UserAuthStatuses.failureAuth:
          return Text('Failure: ${userCubit.state.error}');

        case UserAuthStatuses.loadingAuth:
          return CircularProgressIndicator();

        default:
          return Text('default');
      // }
    }
  }
}

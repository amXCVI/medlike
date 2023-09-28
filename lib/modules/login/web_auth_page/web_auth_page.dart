import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/web_auth_page/password_input.dart';
import 'package:medlike/modules/login/web_auth_page/phone_input.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/buttons/link_button.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/default_scaffold/web_auth_pages_body_container.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class WebAuthPage extends StatefulWidget {
  const WebAuthPage({Key? key}) : super(key: key);

  @override
  State<WebAuthPage> createState() => _WebAuthPageState();
}

class _WebAuthPageState extends State<WebAuthPage> {
  final FocusNode phoneInputFocus = FocusNode();
  late String phoneString = '';
  late final TextEditingController phoneController =
      TextEditingController(text: '');
  String? phoneInputError;

  final FocusNode passwordInputFocus = FocusNode();
  late String passwordString = '';
  late final TextEditingController passwordController =
      TextEditingController(text: '');
  String? passwordInputError;

  void onChangePhone(String text) {
    RegExp exp = RegExp(r"[^0-9]+");
    setState(() {
      phoneString = phoneController.text.replaceAll(exp, '');
    });
    if (phoneController.text.replaceAll(exp, '').length == 11) {
      phoneInputFocus.unfocus();
      _savePhoneNumber(phoneController.text);
    } else {
      setState(() {
        phoneInputError = null;
      });
    }
  }

  onChangePassword(String text) {
    setState(() {
      passwordString = text;
    });
  }

  void _savePhoneNumber(String phone) async {
    if (phoneString.length != 11) {
      setState(() {
        phoneInputError = 'Номер телефона имеет некорректную длину';
      });
      return;
    }

    final response = await context
        .read<UserCubit>()
        .checkUserAccount(phoneNumber: phoneString);

    if (response.message != null) {
      setState(() {
        phoneInputError = response.message;
      });
    } else {
      passwordInputFocus.requestFocus();
    }

    context.read<UserCubit>().tempSavePhoneNumber(phoneString);
    //dispose();
  }

  void onFocusPhoneInput() {
    if (phoneInputError != null) {
      setState(() {
        phoneInputError = null;
      });
      phoneInputFocus.nextFocus();
    }

    if (phoneController.text.isEmpty) {
      Future.delayed(const Duration(milliseconds: 100), () {
        phoneController.text = '+7';
        phoneController.selection = TextSelection.fromPosition(
            TextPosition(offset: phoneController.text.length));
      });
    }
  }

  void authenticateWithPhoneAndPassword(String password) async {
    await context
        .read<UserCubit>()
        .handleSubmitPassword(password)
        .then((value) {
      if (value == null) {
        UserSecureStorage.setField(AppConstants.isAuth,
            'true'); // Актуально только для веб-версии, потому что в ней отсутствует пин-код, а значит проверяется только токен
        context.read<UserCubit>().checkUserAgreements().then((res) {
          if (!res) {
            context.router.replaceAll([AuthUserAgreementsRoute()]);
          } else {
            context.router.replaceAll([const MainRoute()]);
          }
        });
      } else {
        setState(() {
          passwordInputError = value.tryCount == -1
              ? value.message
              : '${value.message}. Осталось попыток: ${value.tryCount}';
        });
      }
    });
  }

  void passwordErrorReset() {
    setState(() {
      passwordInputError = null;
    });
  }

  void handleAuthorization() {
    if (phoneString.length != 11 || passwordController.text.isEmpty) {
      return;
    }
    authenticateWithPhoneAndPassword(passwordController.text);
  }

  void handleForgotPassword() {
    context.router
        .push(RecoverPasswordSmsRoute(phoneNumber: phoneController.text));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: AppConstants.appName,
      isChildrenPage: false,
      isAuth: false,
      isBottomIndent: false,
      onPressedAppLogo: () {},
      actions: const [UnauthSupportButton()],
      child: WebAuthPagesBodyContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Авторизация'.toUpperCase(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 36),
            Text(
              'Введите номер телефона и пароль'.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 52),
            PhoneInput(
              focus: phoneInputFocus,
              controller: phoneController,
              error: phoneInputError,
              onChangePhone: onChangePhone,
            ),
            const SizedBox(height: 52),
            PasswordInput(
              errorReset: passwordErrorReset,
              errorMsg: passwordInputError,
              focus: passwordInputFocus,
              controller: passwordController,
              onSubmitted: authenticateWithPhoneAndPassword,
              onChangePassword: onChangePassword,
            ),
            const SizedBox(height: 38),
            PrimaryButton(
              label: Center(
                  child: Text(
                'продолжить'.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: phoneString.length != 11 ||
                              passwordController.text.isEmpty
                          ? AppColors.mainText
                          : Colors.white,
                    ),
              )),
              disabled:
                  phoneString.length != 11 || passwordController.text.isEmpty,
              onTap: handleAuthorization,
            ),
            const SizedBox(height: 10),
            LinkButton(
              label: Center(
                  child: Text(
                'Не помню пароль'.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: phoneString.length != 11
                        ? AppColors.lightText
                        : AppColors.mainBrandColor),
              )),
              disabled: phoneString.length != 11,
              onTap: handleForgotPassword,
            ),
          ],
        ),
      ),
    );
  }
}

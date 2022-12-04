import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/auth_skeletons/default_auth_skeleton.dart';
import 'package:medlike/modules/login/password_page/password_input.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class PasswordPageWidget extends StatefulWidget {
  const PasswordPageWidget({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  State<PasswordPageWidget> createState() => _PasswordPageWidgetState();
}

class _PasswordPageWidgetState extends State<PasswordPageWidget> {
  String? error;

  Future<bool> getIsSavedPinCode() async {
    String? isSavedPinCodeForAuth =
        await UserSecureStorage.getField(AppConstants.isSavedPinCodeForAuth);
    if (isSavedPinCodeForAuth != null && isSavedPinCodeForAuth == 'true') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> checkIsAcceptedUserAgreements() async {
      bool res = await context.read<UserCubit>().checkUserAgreements();
      return res;
    }

    void _authenticateWithPhoneAndPassword({required String password}) async {
      await context
          .read<UserCubit>()
          .handleSubmitPassword(password)
          .then((value) {
                if (value == null)
                  {
                    checkIsAcceptedUserAgreements().then((res) {
                          if (!res)
                            {
                              context.router
                                  .replaceAll([AuthUserAgreementsRoute()]);
                            }
                          else
                            {
                              context.router.navigateNamed(
                                            AppRoutes.loginPinCodeCreate);
                            }
                        });
                  } else {
                    setState(() {
                      error = value.tryCount == -1 ? 
                        value.message : '${value.message}. Осталось попыток: ${value.tryCount}';
                    });
                  }
              });
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        /// разлогиниваем, если юзер ввел слишком много неправильных паролей
        if (state.tryCount == 0) {
          context.read<UserCubit>().signOut();
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
        if (state.authStatus == UserAuthStatuses.loadingAuth ||
            // state.authStatus == UserAuthStatuses.successAuth ||
            state.getAllUserAgreementsStatus ==
                GetAllUserAgreementsStatuses.loading) {
          return const DefaultAuthSkeleton();
        } else {
          return SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DefaultLoginAnimation(),
                PasswordInput(
                  phoneNumber: widget.phoneNumber,
                  onAuth: _authenticateWithPhoneAndPassword,
                  errorReset: (() {
                    setState(() {
                      error = null;
                    });
                  }),
                  errorMsg: error
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

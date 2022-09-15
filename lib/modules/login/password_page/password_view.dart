import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/auth_skeletons/default_auth_skeleton.dart';
import 'package:medlike/modules/login/password_page/password_input.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/default_login_animation/default_login_animation.dart';

class PasswordPageWidget extends StatelessWidget {
  const PasswordPageWidget({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

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
          .then((value) => {
                if (value)
                  {
                    // if (kIsWeb)
                    //   {
                    //     UserSecureStorage.setField(AppConstants.isAuth, 'true'),
                    //     context
                    //         .read<UserCubit>()
                    //         .setPinCodeToStorage([0, 0, 0, 0, 0]),
                    //     context.router.replaceAll([const MainRoute()]),
                    //   }
                    // else
                    //   {
                    checkIsAcceptedUserAgreements().then((res) => {
                          if (!res)
                            {
                              context.router
                                  .replaceAll([AuthUserAgreementsRoute()])
                            }
                          else
                            {
                              getIsSavedPinCode().then((res) => {
                                    if (res == true)
                                      {
                                        UserSecureStorage.setField(
                                            AppConstants.isAuth, 'true'),
                                        context.router
                                            .replaceAll([const MainRoute()])
                                      }
                                    else
                                      {
                                        context.router.navigateNamed(
                                            AppRoutes.loginPinCodeCreate),
                                      }
                                  })
                            }
                        })
                  },
                // }
              });
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                  phoneNumber: phoneNumber,
                  onAuth: _authenticateWithPhoneAndPassword,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/phone_number_formattier.dart';
import 'package:medlike/utils/helpers/snils_formattier.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dividers/dash_divider.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

import 'esia_register_form_item.dart';

@RoutePage()
class EsiaRegisterPage extends StatelessWidget {
  const EsiaRegisterPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phoneNumber,
    required this.snils,
    required this.sex,
    required this.birthday,
    required this.passportSerial,
    required this.passportNumber,
    required this.passportIssueDate,
    required this.passportIssueId,
    required this.esiaToken,
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String middleName;
  final String phoneNumber;
  final String snils;
  final int sex;
  final String birthday;
  final String passportSerial;
  final String passportNumber;
  final String passportIssueDate;
  final String passportIssueId;
  final String esiaToken;

  @override
  Widget build(BuildContext context) {
    void handleApplyRegisterUser() {
      context
          .read<UserCubit>()
          .createUserAndProfile(
            firstName: firstName,
            lastName: lastName,
            middleName: middleName,
            phoneNumber: phoneNumber,
            snils: snils,
            sex: sex,
            birthday: birthday,
            passportSerial: passportSerial,
            passportNumber: passportNumber,
            passportIssueDate: passportIssueDate,
            passportIssueId: passportIssueId,
            esiaToken: esiaToken,
          )
          .then((registerNewProfileRes) => {
                if (registerNewProfileRes)
                  {
                    context
                        .read<UserCubit>()
                        .esiaAuth(esiaToken)
                        .then((esiaAuthRes) {
                      if (esiaAuthRes!.isUserExists) {
                        context.router.replaceAll([AuthUserAgreementsRoute()]);
                      }
                    })
                  }
              })
          .catchError((err) {
        AppToast.showAppToast(msg: err);
        if (kDebugMode) {
          print(err);
        }
      });
    }

    void closePage() {
      context.router.replaceAll([StartPhoneNumberRoute()]);
    }

    return WillPopScope(
      onWillPop: () async {
        context.router.replaceAll([StartPhoneNumberRoute()]);
        return false;
      },
      child: DefaultScaffold(
          appBarTitle: 'Регистрация',
          actions: const [UnauthSupportButton()],
          bottomNavigationBar: const SizedBox(height: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    child: Text(
                      PhoneNumber.defaultFormattier(phoneNumber),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: DashDivider(),
                  ),
                  EsiaRegisterFormItem(
                    label: 'Фамилия',
                    value: lastName,
                  ),
                  EsiaRegisterFormItem(
                    label: 'Имя',
                    value: firstName,
                  ),
                  EsiaRegisterFormItem(
                    label: 'Отчество',
                    value: middleName,
                  ),
                  EsiaRegisterFormItem(
                    label: 'Дата рождения ',
                    value: birthday,
                  ),
                  EsiaRegisterFormItem(
                    label: 'СНИЛС',
                    value: SnilsString.defaultFormattier(snils),
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                      if (state.createUserAndProfileStatuses !=
                          CreateUserAndProfileStatuses.loading) {
                        return PrimaryButton(
                          label: Text(
                            'зарегистрироваться'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onTap: handleApplyRegisterUser,
                          disabled: false,
                        );
                      } else {
                        return PrimaryButton(
                          label: const Center(
                            child: CircularLoader(),
                          ),
                          onTap: () {},
                          padding: const EdgeInsets.all(4),
                        );
                      }
                    }),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MaterialButton(
                      onPressed: closePage,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: Text('Назад'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: AppColors.mainText)),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

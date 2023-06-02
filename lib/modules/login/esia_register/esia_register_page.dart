import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/phone_number_formattier.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dividers/dash_divider.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

import 'esia_register_form_item.dart';

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
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String middleName;
  final String phoneNumber;
  final String snils;
  final int sex;
  final String birthday;

  @override
  Widget build(BuildContext context) {
    void _handleApplyRegisterUser() {
      context
          .read<UserCubit>()
          .createUserProfileAndMedicalCard(
            firstName: firstName,
            lastName: lastName,
            middleName: middleName,
            phoneNumber: phoneNumber,
            snils: snils,
            sex: sex,
            birthday: birthday,
          )
          .then((registerNewProfileRes) => {
                if (registerNewProfileRes)
                  {
                    context.router.replaceAll([AuthUserAgreementsRoute()])
                  }
              })
          .catchError((err) {});
    }

    void _closePage() {
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
                    value: DateFormat('dd.MM.yyyy')
                        .format(DateTime.parse(birthday)),
                  ),
                  EsiaRegisterFormItem(
                    label: 'СНИЛС',
                    value: snils,
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: PrimaryButton(
                      label: Text(
                        'зарегистрироваться'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      onTap: _handleApplyRegisterUser,
                      disabled: false,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MaterialButton(
                      onPressed: _closePage,
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

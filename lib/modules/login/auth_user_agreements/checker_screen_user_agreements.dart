import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/auth_user_agreements/agreements_list.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/checkbox/custom_checkbox.dart';

class CheckerScreenUserAgreements extends StatefulWidget {
  const CheckerScreenUserAgreements({Key? key}) : super(key: key);

  /// Показать документы на весь экран?
  /// Если переход со страницы логина, а не для подписи

  @override
  State<CheckerScreenUserAgreements> createState() =>
      _CheckerScreenUserAgreementsState();
}

class _CheckerScreenUserAgreementsState
    extends State<CheckerScreenUserAgreements> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    void closePage() {
      HapticFeedback.lightImpact();
      context.router.replaceAll([StartPhoneNumberRoute()]);
    }

    void acceptedAgreements() async {
      await context
          .read<UserCubit>()
          .acceptedAgreements(agreementId: AppConstants.actualUserAgreement)
          .then((value) => {
                context.router.replaceAll([CreatePinCodeRoute()])
              });
    }

    void _onChangeChecker(bool e) {
      setState(() {
        isChecked = e;
      });
    }

    return WillPopScope(
      onWillPop: () async {
        closePage();
        return false;
      },
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: closePage,
                  icon:
                      SvgPicture.asset('assets/icons/app_bar/close_search.svg'),
                ),
                Text(
                  'Согласие с условиями',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 27),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.circleBgFirst,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                'Для использования приложения ознакомьтесь с документами и примите условия',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height - 400,
                child: const AgreementsList()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Row(
                children: [
                  CustomCheckbox(
                    value: isChecked,
                    onChanged: _onChangeChecker,
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        _onChangeChecker(!isChecked);
                      },
                      child: const Text('Я согласен с условиями')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PrimaryButton(
                label: Text(
                  'Согласен'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onTap: acceptedAgreements,
                disabled: isChecked ? false : true,
              ),
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
                child: const Text('Назад'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/pin_code/pin_code_view.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class CreatePinCodePage extends StatefulWidget {
  const CreatePinCodePage({Key? key, this.noUsedBiometric}) : super(key: key);

  final bool? noUsedBiometric;

  @override
  State<CreatePinCodePage> createState() => _CreatePinCodePageState();
}

class _CreatePinCodePageState extends State<CreatePinCodePage> {
  late List<int> initialPinCode;
  late int step = 0;
  late bool isForcedShowingBiometricModal = false;

  @override
  void initState() {
    super.initState();
  }

  void onSuccessBiometricAuthenticate(bool result) {
    context.read<UserCubit>().signInBiometric();
    context.router.replaceAll([const MainRoute()]);
  }

  void onSuccessBiometricDataSaved(bool result) {
    if (result) {
      UserSecureStorage.setField(AppConstants.useBiometricMethodAuthentication,
          SelectedAuthMethods.touchId.toString());
    }

    setState(() {
      isForcedShowingBiometricModal = false;
    });
    context.router.replaceAll([const MainRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        MediaQuery.of(context).size.height <= AppConstants.mdScreenHeight;

    void _savePinCode(List<int> pinCode) {
      context.read<UserCubit>().setPinCodeToStorage(pinCode);
    }

    Future<bool> _saveInitialPinCode(List<int> initialCode) async {
      setState(() {
        initialPinCode = initialCode;
        step = 1;
      });
      return true;
    }

    Future<bool> _checkRepeatPinCode(List<int> repeatPinCode) async {
      if (initialPinCode.join('') == repeatPinCode.join('')) {
        _savePinCode(repeatPinCode);
        if (kIsWeb) {
          context.router.replaceAll([const MainRoute()]);
          return true;
        }

        if (widget.noUsedBiometric == null || widget.noUsedBiometric == false) {
          setState(() {
            isForcedShowingBiometricModal = true;
          });
        } else {
          context.router.replace(const SettingsRoute());
        }
        return true;
      } else {
        AppToast.showAppToast(msg: 'Неверный пин-код');
        return false;
      }
    }

    return WillPopScope(
      onWillPop: () async {
        if (step > 0) {
          setState(() {
            step -= 1;
          });
        } else {
          context.read<UserCubit>().signOut();
          context.router.replaceAll([StartPhoneNumberRoute()]);
        }
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Пин-код',
        actions: const [UnauthSupportButton()],
        isChildrenPage: true,
        bottomNavigationBar: SizedBox(
          height: isSmallScreen ? 20 : 0,
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            shrinkWrap: true,
            children: [
              step == 0
                  ? PinCodeView(
                      pinCodeTitle:
                          'Придумайте пин-код\nдля быстрого входа в приложение',
                      setPinCode: _saveInitialPinCode,
                      key: UniqueKey(),
                      height: constraints.maxHeight,
                      handleBiometricMethod: onSuccessBiometricAuthenticate,
                      noUsedBiometric: widget.noUsedBiometric,
                      isInit: true,
                    )
                  : PinCodeView(
                      pinCodeTitle: 'Повторите пин-код',
                      setPinCode: _checkRepeatPinCode,
                      height: constraints.maxHeight,
                      key: UniqueKey(),
                      handleBiometricMethod: onSuccessBiometricDataSaved,
                      isForcedShowingBiometricModal:
                          isForcedShowingBiometricModal,
                      signInTitle:
                          'Сохраните свои биометрические данные для упрощенного входа в приолжение',
                      noUsedBiometric: widget.noUsedBiometric,
                      isInit: true,
                    )
            ],
          );
        }),
      ),
    );
  }
}

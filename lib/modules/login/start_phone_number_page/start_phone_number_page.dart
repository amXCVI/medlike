import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/bottom_sheets/delete_account_bottom_sheet.dart';
import 'package:medlike/modules/login/bottom_sheets/first_auth_app_bottom_sheet.dart';
import 'package:medlike/modules/login/start_phone_number_page/phone_number_bottom_navigator.dart';
import 'package:medlike/modules/login/start_phone_number_page/start_phone_number_view.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';
import 'package:tap_canvas/tap_canvas.dart';

class StartPhoneNumberPage extends StatefulWidget {
  const StartPhoneNumberPage({Key? key, this.isDeletingProfile = false})
      : super(key: key);

  final bool isDeletingProfile;

  @override
  State<StartPhoneNumberPage> createState() => _StartPhoneNumberPageState();
}

class _StartPhoneNumberPageState extends State<StartPhoneNumberPage> {
  late bool isShowingDeleteProfileAlert = false;
  late bool isShowingFirstAuthAppAlert = false;

  @override
  void initState() {
    getUserPhoneNumber();
    isShowingDeleteProfileAlert = widget.isDeletingProfile;
    super.initState();
  }

  void getUserPhoneNumber() async {
    String? userPhoneNumber =
        await UserSecureStorage.getField(AppConstants.userPhoneNumber);

    if (userPhoneNumber == null) {
      setState(() {
        isShowingFirstAuthAppAlert = true;
      });
    } else {
      setState(() {
        isShowingFirstAuthAppAlert = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void _showModal(Widget bottomSheet) {
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12))),
          context: context,
          builder: (context) => bottomSheet);
    }

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (isShowingDeleteProfileAlert) {
        _showModal(const DeleteAccountBottomSheet());
        setState(() {
          isShowingDeleteProfileAlert = false;
        });
      }
    });

    Future.delayed(const Duration()).then((value) {
      if (isShowingFirstAuthAppAlert) {
        _showModal(const FirstAuthAppBottomSheet());
        setState(() {
          isShowingFirstAuthAppAlert = false;
        });
      }
    });

    return BlocListener<UserCubit, UserState>(
      listenWhen: (prev, cur) {
        return prev.checkUserAccountStatus != cur.checkUserAccountStatus;
      },
      listener: (context, state) {
        if(state.checkUserAccountStatus == CheckUserAccountStatuses.success &&
          context.router.current.path == AppRoutes.loginPhone) {
          context.read<UserCubit>().savePhoneNumber(state.userPhoneNumber!);
          context.router.push(PasswordRoute(phoneNumber: state.userPhoneNumber!));
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: TapCanvas(
          child: DefaultScaffold(
            child: const StartPhoneNumberView(),
            appBarTitle: AppConstants.appName,
            onPressedAppLogo: () {},
            actions: const [UnauthSupportButton()],
            bottomNavigationBar: const LoginPageBottomNavigationBar(),
          ),
        ),
      ),
    );
  }
}

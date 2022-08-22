import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/bottom_sheets/delete_account_bottom_sheet.dart';
import 'package:medlike/modules/login/bottom_sheets/first_auth_app_bottom_sheet.dart';
import 'package:medlike/modules/login/start_phone_number_page/phone_number_bottom_navigator.dart';
import 'package:medlike/modules/login/start_phone_number_page/start_phone_number_view.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

    return DefaultScaffold(
      child: const StartPhoneNumberView(),
      appBarTitle: 'Заполярье',
      onPressedAppLogo: () {},
      bottomNavigationBar: const LoginPageBottomNavigationBar(),
    );
  }
}

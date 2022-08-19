import 'package:flutter/material.dart';
import 'package:medlike/modules/login/bottom_sheets/delete_account_bottom_sheet.dart';
import 'package:medlike/modules/login/start_phone_number_page/phone_number_bottom_navigator.dart';
import 'package:medlike/modules/login/start_phone_number_page/start_phone_number_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class StartPhoneNumberPage extends StatefulWidget {
  const StartPhoneNumberPage({Key? key, this.isDeletingProfile = false})
      : super(key: key);

  final bool isDeletingProfile;

  @override
  State<StartPhoneNumberPage> createState() => _StartPhoneNumberPageState();
}

class _StartPhoneNumberPageState extends State<StartPhoneNumberPage> {
  late bool isShowingDeleteProfileAlert;

  @override
  void initState() {
    super.initState();
    isShowingDeleteProfileAlert = widget.isDeletingProfile;
  }

  @override
  Widget build(BuildContext context) {
    void _showModal() {
      showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          context: context,
          builder: (context) => const DeleteAccountBottomSheet());
    }

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (isShowingDeleteProfileAlert) {
        _showModal();
        setState(() {
          isShowingDeleteProfileAlert = false;
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

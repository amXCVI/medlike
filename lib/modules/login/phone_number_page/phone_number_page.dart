import 'package:flutter/material.dart';
import 'package:medlike/modules/login/bottom_sheets/delete_account_bottom_sheet.dart';
import 'package:medlike/modules/login/phone_number_page/login_view.dart';
import 'package:medlike/modules/login/phone_number_page/phone_number_bottom_navigator.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key, this.isDeletingProfile = false})
      : super(key: key);

  final bool isDeletingProfile;

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
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

    return const DefaultScaffold(
      child: LoginPageWidget(),
      appBarTitle: 'Заполярье',
      bottomNavigationBar: LoginPageBottomNavigationBar(),
    );
  }
}

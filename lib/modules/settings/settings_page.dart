import 'package:flutter/material.dart';
import 'package:medlike/modules/settings/settings_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
        appBarTitle: 'Настройки', child: SettingsList());
  }
}

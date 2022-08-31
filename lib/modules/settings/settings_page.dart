import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/settings/settings_list.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.router.navigateNamed(AppRoutes.main);
        return false;
      },
      child: const DefaultScaffold(
          appBarTitle: 'Настройки', child: SettingsList()),
    );
  }
}

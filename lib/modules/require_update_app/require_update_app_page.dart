import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';

@RoutePage()
class RequireUpdateAppPage extends StatelessWidget {
  const RequireUpdateAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text('Обновление приложения',
            style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
      ),
      body: const Center(
        child: EmptyListWidget(
          imgPath: 'assets/images/update_app.png',
          label:
              'Эта версия приложения более не поддерживается. Пожалуйста, обновите приложение.',
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: PrimaryButton(
            label: Text(
              'Обновить'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              UserSecureStorage.setField(
                  AppConstants.isActualAppVersion, 'true');
              InAppUpdate.performImmediateUpdate();
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';

class FirstAuthAppBottomSheet extends StatelessWidget {
  const FirstAuthAppBottomSheet({Key? key}) : super(key: key);

  void closeBottomSheet(BuildContext context) {
    UserSecureStorage.setField(AppConstants.startBottomSheetShowed, 'true');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/auth_application.png',
                  width: 250,
                ),
              ),
              const SizedBox(height: 27),
              Text('Регистрация в приложении',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20)),
              const SizedBox(height: 16),
              const Text(
                  'Для регистрации в приложении обратитесь в регистратуру клиники, услугами которой собираетесь пользоваться или зарегистрируйтесь через Госуслуги.'),
              const SizedBox(height: 32),
              PrimaryButton(
                  label: Text(
                    'Понятно'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    closeBottomSheet(context);
                  }),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

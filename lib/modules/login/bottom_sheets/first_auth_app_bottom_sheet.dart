import 'package:flutter/material.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';

class FirstAuthAppBottomSheet extends StatelessWidget {
  const FirstAuthAppBottomSheet({Key? key}) : super(key: key);

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
                  'Для входа в приложение обратитесь в регистратуру клиники, услугами которой собираетесь пользоваться. Если Вы уже получили доступ — можете продолжить вход.'),
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
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

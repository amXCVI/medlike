import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 24.0),
      actionsAlignment: MainAxisAlignment.center,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/icons/settings/ic_app_filled.png'),
          Text('Версия приложения 1.0',
              style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 8),
          const Text('©ООО Медотрейд',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightText)),
          const SizedBox(height: 4),
          const Text('Все права защищены',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightText)),
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text('ок'.toUpperCase()),
        ),
      ],
    );
  }
}

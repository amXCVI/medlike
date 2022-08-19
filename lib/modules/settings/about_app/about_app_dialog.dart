import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/dividers/default_divider.dart';

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsAlignment: MainAxisAlignment.center,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Image.asset('assets/icons/settings/ic_app_filled.png'),
          //! Нужно переделать. Чтобы версия приложения подтягивалась автоматически
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
          const SizedBox(height: 24),
          const DefaultDivider(),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 80.0),
              child: Text(
                'ок'.toUpperCase(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

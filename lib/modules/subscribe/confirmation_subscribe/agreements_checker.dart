import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/checkbox/custom_checkbox.dart';

class AgreementsChecker extends StatelessWidget {
  const AgreementsChecker(
      {Key? key, required this.isChecked, required this.setIsCheckedValue})
      : super(key: key);

  final bool isChecked;
  final void Function(bool value) setIsCheckedValue;

  @override
  Widget build(BuildContext context) {
    void onTapChecker() {
      setIsCheckedValue(!isChecked);
    }

    void onTapDocsLink() {
      context.router.push(AgreementsRoute(isAppointmentAgreements: true));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTapChecker,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 10,
              bottom: 10,
              right: 15
            ),
            child: CustomCheckbox(
              value: isChecked,
              onChanged: (e) {
                setIsCheckedValue(e);
              },
            ),
          ),
        ),
        Expanded(
          child: Text.rich(
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 3,
            TextSpan(
              children: [
                TextSpan(
                    text: 'Я ознакомлен со всеми',
                    recognizer: TapGestureRecognizer()..onTap = onTapChecker),
                TextSpan(
                    text: ' документами ',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()..onTap = onTapDocsLink),
                TextSpan(
                    text: 'и принимаю условия "Z-Clinic"',
                    recognizer: TapGestureRecognizer()..onTap = onTapChecker)
              ],
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

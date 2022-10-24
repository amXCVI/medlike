import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:tap_canvas/tap_canvas.dart';

class UnauthSupportForm extends StatelessWidget {
  const UnauthSupportForm({
    Key? key,
    required this.controllerMessage,
    required this.controllerEmail,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerMessage;
  final TextEditingController controllerEmail;

  @override
  Widget build(BuildContext context) {
    void unFocus() {
      FocusScope.of(context).unfocus();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TapOutsideDetectorWidget(
              onTappedOutside: unFocus,
              child: TextFormField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail для обратной связи',
                  labelStyle: const TextStyle(
                      color: AppColors.lightText,
                      fontSize: 17,
                      fontWeight: FontWeight.w300),
                  floatingLabelStyle: TextStyle(
                      color: controllerEmail.text.isEmpty
                          ? AppColors.lightText
                          : AppColors.mainText,
                      fontWeight: FontWeight.w300),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.lightText),
                ),
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.start,
                enableSuggestions: false,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                validator: (value) {
                  String pattern =
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$";
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value!) ||
                      value == null ||
                      value.isEmpty) {
                    return 'Пожалуйста, введите правильный адрес электронной почты';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            TapOutsideDetectorWidget(
              onTappedOutside: unFocus,
              child: TextFormField(
                controller: controllerMessage,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Сообщение',
                  labelStyle: const TextStyle(
                      color: AppColors.lightText,
                      fontSize: 17,
                      fontWeight: FontWeight.w300),
                  floatingLabelStyle: TextStyle(
                      color: controllerMessage.text.isEmpty
                          ? AppColors.lightText
                          : AppColors.mainText,
                      fontWeight: FontWeight.w300),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.lightText),
                ),
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.start,
                enableSuggestions: false,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, заполните обязательное поле';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class SupportForm extends StatelessWidget {
  const SupportForm({
    Key? key,
    required this.controllerTheme,
    required this.controllerMessage,
    required this.controllerEmail,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerTheme;
  final TextEditingController controllerMessage;
  final TextEditingController controllerEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controllerTheme,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Тема *',
                labelStyle: const TextStyle(
                  color: AppColors.lightText,
                  fontSize: 17,
                  fontWeight: FontWeight.w300
                ),
                floatingLabelStyle: TextStyle(
                  color: controllerTheme.text.isEmpty 
                    ? AppColors.lightText : AppColors.mainText, 
                  fontWeight: FontWeight.w300
                ),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
              ),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, заполните обязательное поле';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: controllerMessage,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Сообщение *',
                labelStyle: const TextStyle(
                  color: AppColors.lightText,
                  fontSize: 17,
                  fontWeight: FontWeight.w300
                ),
                floatingLabelStyle: TextStyle(
                  color: controllerMessage.text.isEmpty 
                    ? AppColors.lightText : AppColors.mainText, 
                  fontWeight: FontWeight.w300
                ),
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
            const SizedBox(height: 32),
            TextFormField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail *',
                labelStyle: const TextStyle(
                  color: AppColors.lightText,
                  fontSize: 17,
                  fontWeight: FontWeight.w300
                ),
                floatingLabelStyle: TextStyle(
                  color: controllerEmail.text.isEmpty 
                    ? AppColors.lightText : AppColors.mainText, 
                  fontWeight: FontWeight.w300
                ),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
              ),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
              enableSuggestions: false,
              validator: (value) {
                String pattern =
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$";
                RegExp regex = RegExp(pattern);
                if (!regex.hasMatch(value!) || value == null || value.isEmpty) {
                  return 'Пожалуйста, введите правильный адрес электронной почты';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

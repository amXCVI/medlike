import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:tap_canvas/tap_canvas.dart';

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
    void unFocus() {
      //FocusScope.of(context).unfocus();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
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
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
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
                      return 'Пожалуйста, введите e-mail';
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
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
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
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, заполните обязательное поле';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

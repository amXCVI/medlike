import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/modules/appointments/feedback/rating_starts.dart';
import 'package:medlike/themes/colors.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'captions_list.dart';

class FeedbackForm extends StatelessWidget {
  const FeedbackForm(
      {Key? key,
      required this.ratingValue,
      required this.setRating,
      required this.formKey,
      required this.controllerCaption,
      required this.controllerMessage,
      required this.controllerEmail,
      required this.setCaption})
      : super(key: key);

  final int ratingValue;
  final void Function(int e) setRating;
  final GlobalKey<FormState> formKey;
  final TextEditingController controllerCaption;
  final TextEditingController controllerMessage;
  final TextEditingController controllerEmail;
  final void Function(String e) setCaption;

  @override
  Widget build(BuildContext context) {
    void unFocus() {
      FocusScope.of(context).unfocus();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Оцените прием',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w700)),
            RatingStarsWidget(ratingValue: ratingValue, setRating: setRating),
            DropdownMenu<String>(
              controller: controllerCaption,
              width: MediaQuery.of(context).size.width - 32,
              enableFilter: false,
              // isExpanded: true,
              label: const Text(
                'Тема',
                style: TextStyle(
                    color: AppColors.lightText,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
              trailingIcon: RotatedBox(
                quarterTurns: 0,
                child: SvgPicture.asset(
                  'assets/icons/appointments/trailing_icon.svg',
                ),
              ),
              dropdownMenuEntries: captionsList,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: const TextStyle(
                    color: AppColors.lightText,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
                floatingLabelStyle: TextStyle(
                    color: controllerCaption.text.isEmpty
                        ? AppColors.lightText
                        : AppColors.mainText,
                    fontWeight: FontWeight.w300),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
              ),
              menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.background)),
              onSelected: (String? e) {
                setCaption(e.toString());
              },
            ),
            TapOutsideDetectorWidget(
              onTappedOutside: unFocus,
              child: TextFormField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
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
            const SizedBox(height: 24),
            TapOutsideDetectorWidget(
              onTappedOutside: unFocus,
              child: TextFormField(
                controller: controllerMessage,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Отзыв',
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

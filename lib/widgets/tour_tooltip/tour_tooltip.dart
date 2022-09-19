import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/tour_tooltip/text_popup.dart';

class TourTooltip {
  BuildContext context;

  TourTooltip(this.context);

  factory TourTooltip.of(BuildContext context) {
    return TourTooltip(context);
  }

  TextPopup create(String text, {
    double? width,
    double? height,
    Function? onDismiss
  }) {
    return TextPopup(
      context,
      text: text,
      textStyle: const TextStyle(
        color: AppColors.mainAppBackground,
        fontWeight: FontWeight.w300,
        fontSize: 14,
        height: 1.42
      ),
      height: height ?? 64,
      width: width ?? 272,
      backgroundColor: AppColors.mainText,
      padding: const EdgeInsets.all(12.0),
      borderRadius: BorderRadius.circular(8.0),
      onDismiss: () {
        onDismiss?.call();
      }
    );
  }
}

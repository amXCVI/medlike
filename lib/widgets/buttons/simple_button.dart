import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/themes/colors.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key? key,
    required this.labelText,
    required this.onTap,
    this.isPrimary = false,
    this.isDisabled = false,
    this.isLoading = false
  }) : super(key: key);

  final String labelText;
  final void Function() onTap;
  final bool isPrimary;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textColor = isDisabled
      ? AppColors.mainAppBackground
      : isPrimary ? AppColors.mainBrandColor : AppColors.mainText; 

    return InkWell(
      onTap: isDisabled ? () {} : onTap,
      child: Container(
        width: 210,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          color: isDisabled
            ? AppColors.lightText
            : AppColors.mainAppBackground,
          border: isPrimary && !isLoading ? Border.all(
            width: 1,
            color: AppColors.mainBrandColor
          ) : null,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: FittedBox(
            fit:BoxFit.cover,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  labelText.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.142,
                    fontWeight: FontWeight.w700,
                    color: textColor
                  ),
                ),
                if (isLoading)  Lottie.asset(
                  'assets/animations/loader_white.json',
                  width: 40
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

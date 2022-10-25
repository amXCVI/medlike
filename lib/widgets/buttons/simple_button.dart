import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key? key,
    required this.labelText,
    required this.onTap,
    this.isPrimary = false,
  }) : super(key: key);

  final String labelText;
  final void Function() onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          color: AppColors.mainAppBackground,
          border: isPrimary ? Border.all(
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
            child: Text(
              labelText.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                height: 1.142,
                fontWeight: FontWeight.w700,
                color: isPrimary ? AppColors.mainBrandColor : AppColors.mainText
              ),
            ),
          ),
        ),
      ),
    );
  }
}

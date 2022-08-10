import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  final Widget label;
  final void Function() onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? () {} : onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          color:
              disabled ? AppColors.lightText : Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: disabled
                  ? AppColors.lightText
                  : Theme.of(context).primaryColor,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: label,
      ),
    );
  }
}

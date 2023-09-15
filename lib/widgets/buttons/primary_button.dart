import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.disabled = false,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  final Widget label;
  final void Function() onTap;
  final bool disabled;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? () {} : onTap,
      child: Container(
        padding: padding,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
            ProjectDeterminer.getProjectType() == Projects.WEB ? 0 : 32,
          )),
          color:
              disabled ? AppColors.lightText : Theme.of(context).primaryColor,
          boxShadow: ProjectDeterminer.getProjectType() == Projects.WEB
              ? []
              : [
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class MainMenuItem extends StatelessWidget {
  const MainMenuItem({
    Key? key,
    required this.svgIconPath,
    required this.title,
    required this.isSelected,
    required this.svgFilledIconPath,
    required this.link,
  }) : super(key: key);

  final String svgIconPath;
  final String svgFilledIconPath;
  final String title;
  final bool isSelected;
  final String link;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(isSelected ? svgFilledIconPath : svgIconPath),
      title: Text(title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color:
                  isSelected ? AppColors.mainBrandColor : AppColors.mainText)),
      selected: isSelected,
      selectedTileColor: Theme.of(context).hoverColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      onTap: () {
        Navigator.pop(context);
        context.router.navigateNamed(link);
      },
    );
  }
}
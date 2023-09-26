import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';

class MainMenuItem extends StatelessWidget {
  const MainMenuItem({
    Key? key,
    required this.svgIconPath,
    required this.title,
    required this.isSelected,
    required this.svgFilledIconPath,
    required this.link,
    this.isIconOnly = false,
  }) : super(key: key);

  final String svgIconPath;
  final String svgFilledIconPath;
  final String title;
  final bool isSelected;
  final String link;
  final bool isIconOnly;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          leading:
              SvgPicture.asset(isSelected ? svgFilledIconPath : svgIconPath),
          title: isIconOnly
              ? const SizedBox()
              : Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : AppColors.mainText,
                      ),
                  maxLines: 2,
                ),
          selected: isSelected,
          selectedTileColor: Theme.of(context).hoverColor,
          tileColor: Theme.of(context).colorScheme.background,
          contentPadding: ProjectDeterminer.getProjectType() == Projects.WEB
              ? const EdgeInsets.symmetric(horizontal: 15, vertical: 8)
              : const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onTap: () {
            Navigator.pop(context);
            context.router.pushNamed(link);
          },
        ),
      ),
    );
  }
}

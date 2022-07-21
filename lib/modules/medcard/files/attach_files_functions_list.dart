import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttachFilesFunctionsList extends StatelessWidget {
  const AttachFilesFunctionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        children: [
          AttachFileItem(
            label: 'Сделать фото',
            iconPath: 'assets/icons/bottom_nav_bar/ic_camera_files_outline.svg',
            onTap: () {},
          ),
          AttachFileItem(
            label: 'Галерея',
            iconPath: 'assets/icons/bottom_nav_bar/ic_image_outline.svg',
            onTap: () {},
          ),
          AttachFileItem(
            label: 'Проводник',
            iconPath: 'assets/icons/bottom_nav_bar/ic_file_outline.svg',
            onTap: () {},
          ),
        ]);
  }
}

class AttachFileItem extends StatelessWidget {
  const AttachFileItem({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final String iconPath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              const SizedBox(width: 30.0),
              Text(label, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}

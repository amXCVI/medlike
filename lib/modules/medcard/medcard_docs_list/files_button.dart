import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/icon_with_bottom_label/icon_with_bottom_label.dart';

class FilesButton extends StatelessWidget {
  const FilesButton({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        context.router.push(FilesRoute(userId: userId));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: IconWithBottomLabel(
        icon: SvgPicture.asset(
            'assets/icons/bottom_nav_bar/ic_media_outline.svg'),
        label: 'Файлы',
      ),
    );
  }
}

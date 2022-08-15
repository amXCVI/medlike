import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.iconSrc,
    required this.onTap,
    this.color,
    this.rightActionWidget,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String iconSrc;
  final Color? color;
  final void Function() onTap;
  final Widget? rightActionWidget;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        highlightColor: Theme.of(context).highlightColor,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        SvgPicture.asset(iconSrc),
                        const SizedBox(width: 27.0),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: color ?? AppColors.mainText),
                              ),
                              const SizedBox(height: 4),
                              subtitle.isNotEmpty
                                  ? Text(
                                      subtitle,
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColors.lightText),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  rightActionWidget ?? const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

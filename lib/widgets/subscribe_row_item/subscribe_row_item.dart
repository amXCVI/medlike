import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class SubscribeRowItem extends StatelessWidget {
  const SubscribeRowItem({
    Key? key,
    this.title = '',
    this.subtitle = '',
    this.defaultSvgIcon = '',
    this.customIcon,
    this.isSelected = false,
    this.isRightArrow = true,
    this.isOverflowHiddenTitle = false,
    this.isOverflowHiddenSubtitle = false,
    this.isFirstSymbolForIcon = true,
    this.radius = 20,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String defaultSvgIcon;
  final Widget? customIcon;
  final bool isFirstSymbolForIcon;
  final bool isSelected;
  final bool isRightArrow;
  final bool isOverflowHiddenTitle;
  final bool isOverflowHiddenSubtitle;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 21.0, bottom: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isSelected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).backgroundColor,
                  radius: radius + 4,
                  child: CircleAvatar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      radius: radius + 2,
                      child: isFirstSymbolForIcon
                          ? CircleAvatar(
                              radius: radius,
                              backgroundColor: AppColors.mainBrand[100],
                              child: Text(title[0],
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  )),
                            )
                          : CircleAvatar(
                              radius: radius,
                            )),
                ),
                const SizedBox(width: 24.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32 - 44 - 16 - 44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        softWrap: true,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : AppColors.mainText),
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
                                      color: Theme.of(context).highlightColor),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            isRightArrow
                ? SvgPicture.asset(
                    'assets/icons/subscribe/right_arrow_icon.svg')
                : const Text(''),
            isSelected
                ? SvgPicture.asset('assets/icons/profile/checked_icon.svg')
                : const Text(''),
          ],
        ),
      ),
    );
  }
}

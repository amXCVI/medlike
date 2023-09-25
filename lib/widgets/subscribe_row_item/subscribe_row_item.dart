import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/doctor_rating/doctor_rating.dart';

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
    this.onTap,
    this.customRightAction,
    this.rating,
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
  final num? rating;
  final void Function()? onTap;
  final Widget? customRightAction;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: InkWell(
        highlightColor: Theme.of(context).highlightColor,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
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
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: isSelected
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.background,
                          radius: radius + 4,
                          child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              radius: radius + 2,
                              child: isFirstSymbolForIcon
                                  ? CircleAvatar(
                                      radius: radius,
                                      backgroundColor: AppColors.mainBrand[50],
                                      child: Text(title[0].toUpperCase(),
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'AquawaxPro',
                                          )),
                                    )
                                  : customIcon),
                        ),
                        const SizedBox(width: 24.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      title.characters
                                          .replaceAll(Characters(''),
                                              Characters('\u{200B}'))
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: isSelected
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : AppColors.mainText),
                                    ),
                                  ),
                                  DoctorRating(rating: rating),
                                ],
                              ),
                              const SizedBox(height: 4),
                              subtitle.isNotEmpty
                                  ? Text(
                                      subtitle,
                                      overflow: TextOverflow.ellipsis,
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
                  isRightArrow
                      ? SvgPicture.asset(
                          'assets/icons/subscribe/right_arrow_icon.svg')
                      : const SizedBox(),
                  isSelected
                      ? SvgPicture.asset(
                          'assets/icons/profile/checked_icon.svg')
                      : const SizedBox(),
                  customRightAction ?? const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/exit_app/exit_app_dialog.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_item.dart';

class UserProfilesListPopup extends StatefulWidget {
  const UserProfilesListPopup({
    Key? key,
    required this.userProfilesList,
    required this.selectedUserProfileId,
  }) : super(key: key);

  final List<UserProfile> userProfilesList;
  final String selectedUserProfileId;

  @override
  State<UserProfilesListPopup> createState() => _UserProfilesListPopupState();
}

class _UserProfilesListPopupState extends State<UserProfilesListPopup> {
  void handleSelectUserProfile(BuildContext context, String userProfileId) {
    context.read<UserCubit>().setSelectedUserId(userProfileId);
  }

  void handleSelectBuilding(BuildContext context, String buildingId) {
    // context.read<SubscribeCubit>().setSelectedBuilding(buildingId);
  }

  void handleTapOnSettings(BuildContext context) {
    context.router.replaceAll([const SettingsRoute()]);
  }

  void handleTapLogOut(BuildContext context) {
    showDialog<void>(
        context: context, builder: (context) => const ExitAppDialog());
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
      // initialValue: selectedMenu,
      icon: SvgPicture.asset('assets/icons/app_bar/ic_dropdown_arrow.svg'),
      tooltip: 'Открыть меню',
      itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>>[
        ...widget.userProfilesList.map((userProfileItem) {
          return PopupMenuItem<dynamic>(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () => handleSelectUserProfile(context, userProfileItem.id),
            child: UserProfileItem(
              userProfileDate: userProfileItem,
              isSelectedItem:
                  widget.selectedUserProfileId == userProfileItem.id,
            ),
          );
        }),
        const PopupMenuItem<dynamic>(
          enabled: false,
          padding: EdgeInsets.zero,
          child: SizedBox(),
        ),
        PopupMenuItem<dynamic>(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onTap: () => handleTapOnSettings(context),
          child: CustomPopupMenuItem(
            title: 'Настройки',
            iconSrc: 'assets/icons/menu_icons/ic_setting_outline.svg',
            rightActionWidget:
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
          ),
        ),
        PopupMenuItem<dynamic>(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onTap: () => handleTapLogOut(context),
          child: CustomPopupMenuItem(
            title: 'Выйти',
            iconSrc: 'assets/icons/settings/ic_exit_outline.svg',
            rightActionWidget:
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
          ),
        ),
        // TODO наверное правильнее будет взять клиники из getAvailableClinicsList
        // TODO не уверен, что текущая логика всегда адекватно сработает
        // TODO проблема в том, что неясен смысл этих клиник
        // TODO если они используются только в записи на прием - то getAvailableClinicsList
        // TODO если используются в скидках и акциях - то getAllClinicsList
        // TODO это совершенно разные списки.
        // TODO к тому же, запись на building, и это не clinic
        // TODO короче, нужно понятное ТЗ
        //
        // ...widget.userProfilesList[0].clinics.map((clinicItem) {
        //   return PopupMenuItem<SampleItem>(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     // onTap: () => handleSelectBuilding(context, clinicItem.id),
        //     child: ClinicItemWeb(
        //       clinicData: clinicItem,
        //       isSelectedItem: false,
        //     ),
        //   );
        // }),
      ],
    );
  }
}

class CustomPopupMenuItem extends StatelessWidget {
  const CustomPopupMenuItem({
    Key? key,
    required this.title,
    required this.iconSrc,
    this.color,
    this.rightActionWidget,
  }) : super(key: key);

  final String title;
  final String iconSrc;
  final Color? color;
  final Widget? rightActionWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 25.0, bottom: 15.0, right: 16.0, left: 16.0),
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
                            ?.copyWith(color: color ?? AppColors.mainText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          rightActionWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}

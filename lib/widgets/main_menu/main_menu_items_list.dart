import 'package:medlike/navigation/routes_names_map.dart';

class MainMenuItemJSON {
  final String svgIconPath;
  final String svgFilledIconPath;
  final String title;
  final String link;

  MainMenuItemJSON(
      {required this.svgIconPath,
      required this.svgFilledIconPath,
      required this.title,
      required this.link});
}

List<MainMenuItemJSON> mainMenuItemsList = [
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_home_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_home_filled.svg',
    title: 'Главная',
    link: AppRoutes.main,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_appointment_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_appointment_filled.svg',
    title: 'Запись на прием',
    link: AppRoutes.subscribeProfiles,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_checklist_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_checklist_filled.svg',
    title: 'Мои приемы',
    link: AppRoutes.myAppointments,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_medcard_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_medcard_filled.svg',
    title: 'Медкарта',
    link: AppRoutes.medcard,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_health_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_health_filled.svg',
    title: 'Показатели здоровья',
    link: AppRoutes.health,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_clinic_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_clinic_filled.svg',
    title: 'Клиника',
    link: AppRoutes.clinicInfo,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_setting_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_setting_filled.svg',
    title: 'Настройки',
    link: AppRoutes.settings,
  ),
];

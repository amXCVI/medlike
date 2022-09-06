import 'package:medlike/navigation/routes_names_map.dart';

class MainMenuItemJSON {
  final String svgIconPath;
  final String svgFilledIconPath;
  final String title;
  final String link;
  final String name;

  MainMenuItemJSON({
    required this.svgIconPath,
    required this.svgFilledIconPath,
    required this.title,
    required this.link,
    required this.name,
  });
}

List<MainMenuItemJSON> mainMenuItemsList = [
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_home_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_home_filled.svg',
    title: 'Главная',
    link: AppRoutes.main,
    name: AppRoutes.main,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_appointment_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_appointment_filled.svg',
    title: 'Запись на прием',
    link: AppRoutes.subscribeProfiles,
    name: '/subscribe',
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_checklist_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_checklist_filled.svg',
    title: 'Мои приемы',
    link: AppRoutes.myAppointments,
    name: AppRoutes.myAppointments,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_medcard_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_medcard_filled.svg',
    title: 'Медкарта',
    link: AppRoutes.medcard,
    name: AppRoutes.medcard,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_health_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_health_filled.svg',
    title: 'Показатели здоровья',
    link: AppRoutes.healthProfiles,
    name: AppRoutes.healthProfiles,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_clinic_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_clinic_filled.svg',
    title: 'Клиника',
    link: AppRoutes.clinicInfo,
    name: AppRoutes.clinicInfo,
  ),
  MainMenuItemJSON(
    svgIconPath: 'assets/icons/menu_icons/ic_setting_outline.svg',
    svgFilledIconPath: 'assets/icons/menu_icons/ic_setting_filled.svg',
    title: 'Настройки',
    link: AppRoutes.settings,
    name: AppRoutes.settings,
  ),
];

import 'package:medlike/navigation/routes_names_map.dart';

class GridItemModel {
  final String imgSrc;
  final String label;
  final String actionLink;

  GridItemModel({
    required this.imgSrc,
    required this.label,
    required this.actionLink,
  });
}

List<GridItemModel> gridItemsList = [
  GridItemModel(
    actionLink: AppRoutes.myAppointments,
    imgSrc: 'assets/icons/main_page/ic_main_button_two@2x.png',
    label: 'Мои приемы',
  ),
  GridItemModel(
    actionLink: AppRoutes.medcard,
    imgSrc: 'assets/icons/main_page/ic_main_button_three@2x.png',
    label: 'Медкарта',
  ),
  GridItemModel(
    actionLink: AppRoutes.health,
    imgSrc: 'assets/icons/main_page/ic_main_button_five@2x.png',
    label: 'Показатели здоровья',
  ),
  GridItemModel(
    actionLink: AppRoutes.clinicInfo,
    imgSrc: 'assets/icons/main_page/ic_main_button_four@2x.png',
    label: 'Услуги и цены',
  ),
];

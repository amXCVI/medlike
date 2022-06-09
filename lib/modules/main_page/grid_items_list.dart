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
    actionLink: AppRoutes.subscribeProfiles,
    imgSrc: 'assets/icons/main_page/ic_main_button_one@1x.png',
    label: 'Запись на прием',
  ),
  GridItemModel(
    actionLink: AppRoutes.myAppointments,
    imgSrc: 'assets/icons/main_page/ic_main_button_two@1x.png',
    label: 'Мои приемы',
  ),
  GridItemModel(
    actionLink: AppRoutes.medcard,
    imgSrc: 'assets/icons/main_page/ic_main_button_three@1x.png',
    label: 'Медкарта',
  ),
  GridItemModel(
    actionLink: AppRoutes.settings,
    imgSrc: 'assets/icons/main_page/ic_main_button_four@1x.png',
    label: 'Услуги и цены',
  ),
];

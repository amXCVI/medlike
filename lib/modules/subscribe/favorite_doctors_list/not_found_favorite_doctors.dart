import 'package:flutter/material.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';

class NotFoundFavoriteDoctors extends StatelessWidget {
  const NotFoundFavoriteDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyListWidget(
      imgPath: 'assets/images/not_found_favorite_doctors.png',
      label: 'Здесь будет список избранных врачей',
    );
  }
}

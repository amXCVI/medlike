import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctor_item.dart';
import 'package:medlike/modules/subscribe/favorite_doctors_list/not_found_favorite_doctors.dart';

class FavoriteDoctorsList extends StatefulWidget {
  const FavoriteDoctorsList({
    Key? key,
    required this.doctorsList,
    this.onRefreshData,
  }) : super(key: key);

  final List<FavoriteDoctor> doctorsList;
  final dynamic onRefreshData;

  @override
  State<FavoriteDoctorsList> createState() => _FavoriteDoctorsListState();
}

class _FavoriteDoctorsListState extends State<FavoriteDoctorsList> {
  void _handleTapOnDoctor(FavoriteDoctor doctor) {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.onRefreshData(),
      child: widget.doctorsList.isNotEmpty
          ? ListView(shrinkWrap: true, children: [
              ...widget.doctorsList
                  .map((item) => FavoriteDoctorItem(
                        doctorItem: item,
                        onTap: () {
                          _handleTapOnDoctor(item);
                        },
                      ))
                  .toList()
            ])
          : const NotFoundFavoriteDoctors(),
    );
  }
}

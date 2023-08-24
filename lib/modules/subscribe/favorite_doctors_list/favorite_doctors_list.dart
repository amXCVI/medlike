import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctor_item.dart';
import 'package:medlike/modules/subscribe/favorite_doctors_list/not_found_favorite_doctors.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class FavoriteDoctorsList extends StatefulWidget {
  const FavoriteDoctorsList({
    Key? key,
    required this.doctorsList,
    this.onRefreshData,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
  }) : super(key: key);

  final List<FavoriteDoctor> doctorsList;
  final dynamic onRefreshData;
  final String userId;
  final String buildingId;
  final String clinicId;

  @override
  State<FavoriteDoctorsList> createState() => _FavoriteDoctorsListState();
}

class _FavoriteDoctorsListState extends State<FavoriteDoctorsList> {
  void _handleTapOnDoctor(FavoriteDoctor doctor) {
    int categoryTypeId = doctor.categoryType;
    Doctor favoriteDoctor = Doctor(
      id: doctor.id,
      lastName: doctor.lastName,
      firstName: doctor.firstName,
      middleName: doctor.middleName,
      specializationId: doctor.specializationId,
      specialization: doctor.specialization,
      price: 0,
      //? price. Может, здесь нужно что-то другое?????
      categoryType: categoryTypeId,
      isFavorite: true,
      categories: [],
      imageId: doctor.imageId,
      shortinfo: '', //
      experience: doctor.experience,
      rateAsSotr: doctor.rateAsSotr,
      rateAsUser: doctor.rateAsUser,
      reviews: [],
      comment: '',
    );
    context.read<SubscribeCubit>().setSelectedDoctor(favoriteDoctor);
    if (CategoryTypes.serviceCategoryTypeIds.contains(categoryTypeId)) {
      context.router.push(ScheduleRoute(
        pageTitle:
            '${favoriteDoctor.lastName} ${favoriteDoctor.firstName} ${favoriteDoctor.middleName}',
        pageSubtitle: favoriteDoctor.specialization,
        userId: widget.userId,
        buildingId: widget.buildingId,
        clinicId: widget.clinicId,
        categoryTypeId: categoryTypeId,
        doctorId: favoriteDoctor.id,
        isAny: false,
      ));
    } else {
      context.router.push(ResearchesListRoute(
        userId: widget.userId,
        buildingId: widget.buildingId,
        clinicId: widget.clinicId,
        categoryTypeId: categoryTypeId,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.onRefreshData(),
      child: widget.doctorsList.isNotEmpty
          ? DefaultScrollbar(
              child: ListView(shrinkWrap: true, children: [
                ...widget.doctorsList
                    .map((item) => FavoriteDoctorItem(
                          doctorItem: item,
                          onTap: () {
                            _handleTapOnDoctor(item);
                          },
                        ))
                    .toList()
              ]),
            )
          : const NotFoundFavoriteDoctors(),
    );
  }
}

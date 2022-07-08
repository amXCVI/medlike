import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/services_list/service_item.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({
    Key? key,
    required this.servicesList,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    this.onRefreshData,
  }) : super(key: key);

  final List<NavigationItem> servicesList;
  final String userId;
  final String buildingId;
  final String clinicId;
  final dynamic onRefreshData;

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  void _handleTapOnService(NavigationItem service) {
    context.read<SubscribeCubit>().setSelectedService(service);
    // В зависимости от категории услуг след.страница - Исследования или Специализации
    if (service.categoryType != 0 && service.categoryType != 1) {
      context.router.push(ResearchesListRoute(
        userId: widget.userId,
        categoryTypeId: service.categoryType as int,
        clinicId: widget.clinicId,
        buildingId: widget.buildingId,
      ));
    } else {
      context.router.push(SpecialisationsListRoute(
        userId: widget.userId,
        categoryTypeId: service.categoryType as int,
        clinicId: widget.clinicId,
        buildingId: widget.buildingId,
      ));
    }
  }

  _handleTapOnFavoriteDoctors() {
    context.router.push(FavoriteDoctorsListRoute(
      userId: widget.userId,
      buildingId: widget.buildingId,
      clinicId: widget.clinicId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.onRefreshData(),
      child: ListView(shrinkWrap: true, children: [
        SubscribeRowItem(
          title: 'Избранные',
          isFirstSymbolForIcon: false,
          customIcon: CircleAvatar(
            backgroundColor: Colors.white,
            child:
                SvgPicture.asset('assets/icons/subscribe/favorite_doctors.svg'),
          ),
          onTap: _handleTapOnFavoriteDoctors,
        ),
        ...widget.servicesList
            .map((item) => ServiceItem(
                  serviceItem: item,
                  onTap: () {
                    _handleTapOnService(item);
                  },
                ))
            .toList()
      ]),
    );
  }
}

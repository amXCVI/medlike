import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/address.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/contacts_list.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/maps_services_scheet.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/sliding_panel_header.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/work_times_list.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ExpandedSlidingPanel extends StatelessWidget {
  const ExpandedSlidingPanel({Key? key, required this.selectedBuilding})
      : super(key: key);

  final BuildingLatLngModel selectedBuilding;

  void onTapBuilding() {}

  @override
  Widget build(BuildContext context) {
    void _handleTapPrice() {
      context.router.push(PriceRoute(clinicId: selectedBuilding.id));
    }

    void _handleTapSales() {
      context.router.push(SalesRoute(clinicId: selectedBuilding.id));
    }

    void _handleTapSubscribe(int profilesCount, String userId) {
      if (profilesCount == 1) {
        context.router.push(ServicesListRoute(
            userId: userId,
            buildingId: selectedBuilding.id,
            clinicId: selectedBuilding.id));
      } else {
        context.router.push(const ProfilesListRoute());
      }
    }

    void _openMapsSheet(context) {
      openMapsSheet(
          context: context,
          lat: selectedBuilding.latitude,
          lng: selectedBuilding.longitude,
          clinicName: selectedBuilding.name);
    }

    return Column(
      children: [
        SlidingPanelHeader(clinicName: selectedBuilding.name),
        BuildingAddress(
          address: selectedBuilding.address,
          clinicName: selectedBuilding.name,
          lat: selectedBuilding.latitude,
          lng: selectedBuilding.longitude,
        ),
        const SizedBox(height: 32),
        Expanded(
          child: ListView(
            children: [
              WorkTimesList(workTimes: selectedBuilding.workTime),
              const Divider(indent: 16.0, endIndent: 16.0, height: 2),
              ContactsList(phonesList: selectedBuilding.phone),
              const Divider(indent: 16.0, endIndent: 16.0, height: 2),
              SubscribeRowItem(
                title: 'Прейскурант',
                customIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                      'assets/icons/clinics/ic_attention_circle.svg'),
                ),
                isFirstSymbolForIcon: false,
                onTap: _handleTapPrice,
              ),
              SubscribeRowItem(
                title: 'Акции и скидки',
                customIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child:
                      SvgPicture.asset('assets/icons/clinics/ic_stok_star.svg'),
                ),
                isFirstSymbolForIcon: false,
                onTap: _handleTapSales,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      label: Text(
                        'Записаться'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        _handleTapSubscribe(
                            state.userProfiles!.length, state.selectedUserId!);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MaterialButton(
                  onPressed: () {
                    _openMapsSheet(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  height: 48,
                  child: const Text('Проложить маршрут'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

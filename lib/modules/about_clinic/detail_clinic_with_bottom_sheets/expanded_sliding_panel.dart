import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/address.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/contacts_list.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/maps_services_scheet.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/next_action_button_item.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/sliding_panel_header.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/work_times_list.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/buttons/primary_button.dart';

class ExpandedSlidingPanel extends StatelessWidget {
  const ExpandedSlidingPanel({
    Key? key,
    required this.buildingsList,
    required this.onChangeBuildingIndex,
    required this.selectedBuilding,
  }) : super(key: key);

  final List<BuildingLatLngModel> buildingsList;
  final void Function(BuildingLatLngModel) onChangeBuildingIndex;
  final BuildingLatLngModel selectedBuilding;

  @override
  Widget build(BuildContext context) {
    void _handleTapPrice(String clinicId) {
      context.router.push(PriceRoute(clinicId: clinicId));
    }

    void _handleTapSales(String clinicId) {
      context.router.push(SalesRoute(clinicId: clinicId));
    }

    void _handleTapSubscribe(
        int profilesCount, String userId, String clinicId) {
      if (profilesCount == 1) {
        context.router.push(ClinicsListRoute(
          userId: userId,
        ));
      } else {
        context.router.push(const SubscribeProfilesListRoute());
      }
    }

    void _openMapsSheet(context, BuildingLatLngModel buildingItem) {
      openMapsSheet(
          context: context,
          lat: buildingItem.latitude,
          lng: buildingItem.longitude,
          clinicName: buildingItem.name);
    }

    return Column(
      children: [
        const SlidingPanelHeaderMark(),
        CarouselSlider(
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .80 - 152,
              viewportFraction: 1,
              initialPage: buildingsList.indexOf(selectedBuilding) + 1,
              autoPlay: false,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              onPageChanged: (index, _) {
                onChangeBuildingIndex(buildingsList[index]);
              }),
          items: [
            ...buildingsList
                .map(
                  (buildingItem) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SlidingPanelHeader(
                          clinicName: buildingsList[
                                  buildingsList.indexOf(selectedBuilding)]
                              .name),
                      BuildingAddress(
                        address: buildingsList[
                                buildingsList.indexOf(selectedBuilding)]
                            .address,
                        clinicName: buildingsList[
                                buildingsList.indexOf(selectedBuilding)]
                            .name,
                        lat: buildingsList[
                                buildingsList.indexOf(selectedBuilding)]
                            .latitude,
                        lng: buildingsList[
                                buildingsList.indexOf(selectedBuilding)]
                            .longitude,
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: ListView(
                          children: [
                            WorkTimesList(
                                workTimes: buildingsList[
                                        buildingsList.indexOf(selectedBuilding)]
                                    .workTime),
                            const Divider(
                                indent: 16.0, endIndent: 16.0, height: 2),
                            ContactsList(
                                phonesList: buildingsList[
                                        buildingsList.indexOf(selectedBuilding)]
                                    .phone),
                            const Divider(
                                indent: 16.0, endIndent: 16.0, height: 2),
                            NextActionButtonItem(
                              handleTap: () {
                                _handleTapPrice(buildingsList[
                                        buildingsList.indexOf(selectedBuilding)]
                                    .id);
                              },
                              iconPath:
                                  'assets/icons/clinics/ic_doc_oval-2.svg',
                              title: 'Прейскурант',
                            ),
                            const Divider(
                                indent: 16.0, endIndent: 16.0, height: 2),
                            NextActionButtonItem(
                              handleTap: () {
                                _handleTapSales(buildingsList[
                                        buildingsList.indexOf(selectedBuilding)]
                                    .id);
                              },
                              iconPath:
                                  'assets/icons/clinics/ic_doc_oval-3.svg',
                              title: 'Акции и скидки',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList()
          ],
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
                    state.userProfiles!.length,
                    state.userProfiles![0].id,
                    buildingsList[buildingsList.indexOf(selectedBuilding)].id,
                  );
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
              _openMapsSheet(context,
                  buildingsList[buildingsList.indexOf(selectedBuilding)]);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            height: 48,
            child: const Text('Проложить маршрут'),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

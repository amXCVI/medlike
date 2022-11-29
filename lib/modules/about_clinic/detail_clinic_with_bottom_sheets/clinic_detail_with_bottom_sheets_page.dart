import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/detail_clinic/map_places.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/expanded_sliding_panel.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/collapsed_sliding_panel.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ClinicDetailWithBottomSheetsPage extends StatefulWidget {
  const ClinicDetailWithBottomSheetsPage({
    Key? key,
    required this.selectedClinic,
  }) : super(key: key);

  final ClinicModel selectedClinic;

  @override
  State<ClinicDetailWithBottomSheetsPage> createState() =>
      _ClinicDetailWithBottomSheetsPageState();
}

class _ClinicDetailWithBottomSheetsPageState
    extends State<ClinicDetailWithBottomSheetsPage> {
  BuildingLatLngModel? selectedBuilding = null;
  final PanelController _panelController = PanelController();

  @override
  void initState() {
    super.initState();
  }

  void onTapBuilding(BuildingLatLngModel building) {
    if (!_panelController.isPanelOpen) {
      setState(() {
        selectedBuilding = building;
        _panelController.open();
      });
    }
  }

  /// Ф-я для свайпа строений клиники
  void onChangeBuildingIndex(BuildingLatLngModel building) {
    setState(() {
      selectedBuilding = building;
    });
  }

  void onPanelClosed() {
    if (widget.selectedClinic.buildings.length == 1) {
      context.router.replaceNamed(AppRoutes.clinicInfo);
    } else {
      setState(() {
        _panelController.close();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_panelController.isPanelOpen) {
          onPanelClosed();
        } else {
          context.router.replaceNamed(AppRoutes.clinicInfo);
        }
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: widget.selectedClinic.name,
        isChildrenPage: true,
        bottomNavigationBar: const SizedBox(),
        child: BlocBuilder<ClinicsCubit, ClinicsState>(
          builder: (context, state) {
            List<BuildingLatLngModel>? clinicBuildings = state
                .allDownloadedBuildings
                ?.where((element) => element.id == widget.selectedClinic.id)
                .toSet()
                .toList();

            if (widget.selectedClinic.buildings != null &&
                widget.selectedClinic.buildings.length == 1) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _panelController.open();
              });
            }

            return SlidingUpPanel(
                controller: _panelController,
                maxHeight: MediaQuery.of(context).size.height * .80,
                minHeight: clinicBuildings!.length * 88 + 72 >
                        MediaQuery.of(context).size.height * .4
                    ? MediaQuery.of(context).size.height * .4
                    : clinicBuildings.length * 88 + 72,
                parallaxEnabled: true,
                parallaxOffset: .5,
                onPanelClosed: onPanelClosed,
                panel: ExpandedSlidingPanel(
                  buildingsList: clinicBuildings,
                  onChangeBuildingIndex: onChangeBuildingIndex,
                  selectedBuilding: selectedBuilding ?? clinicBuildings[0],
                  timeZoneOffset: widget.selectedClinic.timeZoneOffset ?? 3,
                ),
                collapsed: CollapsedSlidingPanel(
                  buildingsList: clinicBuildings ?? [],
                  clinicName: widget.selectedClinic.name,
                  onTapBuilding: onTapBuilding,
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                    bottom: clinicBuildings.length * 88 + 72 >
                            MediaQuery.of(context).size.height * .4
                        ? MediaQuery.of(context).size.height * .4
                        : clinicBuildings.length * 88 + 70,
                  ),
                  child: ClinicMapPlaces(
                    buildingsList: clinicBuildings ?? [],
                    handleSelectedBuilding: onTapBuilding,
                    selectedBuildingId: selectedBuilding != null
                        ? selectedBuilding!.buildingId
                        : clinicBuildings[0].buildingId,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ));
          },
        ),
      ),
    );
  }
}

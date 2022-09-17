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
  const ClinicDetailWithBottomSheetsPage(
      {Key? key, required this.selectedClinic})
      : super(key: key);

  final ClinicModel selectedClinic;

  @override
  State<ClinicDetailWithBottomSheetsPage> createState() =>
      _ClinicDetailWithBottomSheetsPageState();
}

class _ClinicDetailWithBottomSheetsPageState
    extends State<ClinicDetailWithBottomSheetsPage> {
  late BuildingModel selectedBuilding;
  final PanelController _panelController = PanelController();
  late int selectedBuildingIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedBuilding = widget.selectedClinic.buildings[0];
  }

  void onTapBuilding(String buildingId) {
    BuildingModel building = widget.selectedClinic.buildings
        .firstWhere((element) => element.buildingId == buildingId);
    int index = widget.selectedClinic.buildings.indexOf(building);
    setState(() {
      selectedBuilding = building;
      selectedBuildingIndex = index;
    });
    _panelController.open();
  }

  /// Ф-я для свайпа строений клиники
  void onChangeBuildingIndex(int newIndex) {
    late int newSelectedIndex = newIndex;
    if (newIndex < 0) {
      newSelectedIndex = widget.selectedClinic.buildings.length - 1;
    } else if (newIndex > widget.selectedClinic.buildings.length - 1) {
      newSelectedIndex = 0;
    }
    setState(() {
      selectedBuilding = widget.selectedClinic.buildings[newSelectedIndex];
      selectedBuildingIndex = newSelectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_panelController.isPanelOpen) {
          _panelController.close();
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
                panel: ExpandedSlidingPanel(
                  buildingsList: clinicBuildings,
                  onChangeBuildingIndex: onChangeBuildingIndex,
                  buildingIndex: selectedBuildingIndex,
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
                    selectedBuildingId: selectedBuilding.buildingId,
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

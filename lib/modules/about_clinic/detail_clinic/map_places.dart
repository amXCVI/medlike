import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';

class ClinicMapPlaces extends StatelessWidget {
  const ClinicMapPlaces({
    Key? key,
    required this.buildingsList,
    required this.handleSelectedBuilding,
    required this.selectedBuildingId,
  }) : super(key: key);

  final List<BuildingLatLngModel> buildingsList;
  final void Function(BuildingLatLngModel) handleSelectedBuilding;
  final String selectedBuildingId;

  @override
  Widget build(BuildContext context) {
    String selectrdBuildingAddress = buildingsList
        .firstWhere((element) => element.buildingId == selectedBuildingId)
        .address;
    return Image.asset(
      selectrdBuildingAddress.contains('Норильск')
          ? 'assets/images/Map_Norilsk.jpg'
          : 'assets/images/Map_Sochy.jpg',
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }
}

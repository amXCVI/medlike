import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/sliding_panel_header.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class CollapsedSlidingPanel extends StatelessWidget {
  const CollapsedSlidingPanel(
      {Key? key,
      required this.clinicName,
      required this.buildingsList,
      required this.onTapBuilding})
      : super(key: key);

  final List<BuildingLatLngModel> buildingsList;
  final String clinicName;
  final void Function(String) onTapBuilding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlidingPanelHeader(clinicName: clinicName),
        Expanded(
          child: ListView(
            children: [
              ...buildingsList.map((buildingItem) => SubscribeRowItem(
                    title: buildingItem.name,
                    isRightArrow: true,
                    onTap: () {
                      onTapBuilding(buildingItem.buildingId);
                    },
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

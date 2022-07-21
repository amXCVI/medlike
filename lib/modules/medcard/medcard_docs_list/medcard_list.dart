import 'package:flutter/material.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_file_item.dart';

class MedcardList extends StatelessWidget {
  const MedcardList(
      {Key? key, required this.medcardDocsList, this.onRefreshData})
      : super(key: key);

  final List<MedcardDocsModel> medcardDocsList;
  final dynamic onRefreshData;

  void _handleTapOnMedcardFile(MedcardDocsModel doc) {
    // context.router.push(
    //     DetailClinicRoute(selectedClinic: doc));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: ListView(
          shrinkWrap: true,
          children: medcardDocsList
              .map((item) => MedcardFileItem(
                    medcardFileItem: item,
                    onTap: () {
                      _handleTapOnMedcardFile(item);
                    },
                  ))
              .toList()),
    );
  }
}

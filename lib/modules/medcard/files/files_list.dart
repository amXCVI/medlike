import 'package:flutter/material.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/modules/medcard/files/file_item.dart';

class FilesList extends StatelessWidget {
  const FilesList({Key? key, required this.userFilesList, this.onRefreshData})
      : super(key: key);

  final List<MedcardUserFileModel> userFilesList;
  final dynamic onRefreshData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: ListView(
          shrinkWrap: true,
          children: userFilesList
              .map((item) => FileItem(
                    fileItem: item,
                    onTap: () {},
                  ))
              .toList()),
    );
  }
}

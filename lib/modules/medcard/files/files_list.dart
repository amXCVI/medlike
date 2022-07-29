import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/files/file_item.dart';
import 'package:medlike/utils/api/api_constants.dart';

class FilesList extends StatelessWidget {
  const FilesList({
    Key? key,
    required this.userFilesList,
    this.onRefreshData,
    required this.userId,
    required this.downloadingFileId,
  }) : super(key: key);

  final List<MedcardUserFileModel> userFilesList;
  final String userId;
  final String downloadingFileId;
  final dynamic onRefreshData;

  @override
  Widget build(BuildContext context) {
    void handleTapOnUserFile(MedcardUserFileModel file) {
      context.read<MedcardCubit>().downloadAndOpenUserFileByUrl(
          fileUrl:
              '${ApiConstants.baseUrl}/api/v1.0/profile/files/${file.id}?userId=$userId',
          fileName: file.filename,
          fileId: file.id);
    }

    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: ListView(
          shrinkWrap: true,
          children: userFilesList
              .map((item) => FileItem(
                    fileItem: item,
                    onTap: () {
                      handleTapOnUserFile(item);
                    },
                    isDownloading: item.id == downloadingFileId,
                  ))
              .toList()),
    );
  }
}

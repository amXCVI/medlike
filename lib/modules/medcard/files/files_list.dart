import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/modules/medcard/files/file_item.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';
import 'package:medlike/widgets/slidable/slidable_widget.dart';

class FilesList extends StatelessWidget {
  const FilesList({
    Key? key,
    required this.userFilesList,
    this.onRefreshData,
    required this.userId,
    required this.downloadingFileId,
    required this.listController,
  }) : super(key: key);

  final ScrollController listController;
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

    void handleDeleteFile(String fileId) {
      HapticFeedback.lightImpact();
      context
          .read<MedcardCubit>()
          .deleteUserFile(fileId: fileId, userId: userId);
    }

    return RefreshIndicator(
        onRefresh: () => onRefreshData(isRefresh: true),
        child: userFilesList.isEmpty
            ? const EmptyListWidget(
                imgPath: 'assets/images/empty_files.png',
                label: 'Здесь будет список ваших файлов')
            : DefaultScrollbar(
                child: ListView(
                  controller: listController,
                  shrinkWrap: true,
                  children: [
                    ...userFilesList
                        .map(
                          (item) => SlidableWidget(
                              onDissmis: () => handleDeleteFile(item.id),
                              dissmisText: "Удалить файл",
                              childWidget: FileItem(
                                fileItem: item,
                                onTap: () {
                                  handleTapOnUserFile(item);
                                },
                                isDownloading: item.id == downloadingFileId,
                              ),
                              previewOnSutisfy: () async {
                                return !(context
                                        .read<TourCubit>()
                                        .state
                                        .tourChecked?[TourChecked.removeFile] ??
                                    false);
                              }(),
                              afterPreviewAction: () => context
                                  .read<TourCubit>()
                                  .checkItem(TourChecked.removeFile)),
                        )
                        .toList()
                  ],
                ),
              ));
  }
}

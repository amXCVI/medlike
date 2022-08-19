import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/files/file_item.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

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
        child: DefaultScrollbar(
          child: ListView(
            controller: listController,
            shrinkWrap: true,
            children: [
              ...userFilesList
                  .map((item) => Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () {
                              handleDeleteFile(item.id);
                            },
                          ),
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  handleDeleteFile(item.id);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 34.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).errorColor,
                                  ),
                                  child: Expanded(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const SizedBox(width: 20.0),
                                          SvgPicture.asset(
                                              'assets/icons/appointments/ic_delete_appointment.svg'),
                                          const SizedBox(width: 20.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        child: FileItem(
                          fileItem: item,
                          onTap: () {
                            handleTapOnUserFile(item);
                          },
                          isDownloading: item.id == downloadingFileId,
                        ),
                      ))
                  .toList()
            ],
          ),
        ));
  }
}

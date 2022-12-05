import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_file_item.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class MedcardList extends StatelessWidget {
  const MedcardList({
    Key? key,
    required this.medcardDocsList,
    this.onRefreshData,
    required this.downloadingFileId,
  }) : super(key: key);

  final List<MedcardDocsModel> medcardDocsList;
  final dynamic onRefreshData;
  final String downloadingFileId;

  @override
  Widget build(BuildContext context) {
    void _handleTapOnMedcardFile(MedcardDocsModel doc) async {
      context.read<MedcardCubit>().downloadAndOpenPdfFileByUrl(
            fileUrl: '/api/v1.0/profile/mdoc/result/pdf?PrescId=${doc.prescId}',
            fileName: doc.nameDoc,
            fileId: doc.prescId,
          );
    }

    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: medcardDocsList.isEmpty
          ? const EmptyListWidget(
              label: 'Здесь будет список ваших медицинских результатов',
              imgPath: 'assets/images/empty_medcard.png',
            )
          : DefaultScrollbar(
              child: ListView(
                  shrinkWrap: true,
                  children: medcardDocsList
                      .map((item) => MedcardFileItem(
                            medcardFileItem: item,
                            onTap: () {
                              _handleTapOnMedcardFile(item);
                            },
                            isDownloading: item.prescId == downloadingFileId,
                          ))
                      .toList()),
            ),
    );
  }
}

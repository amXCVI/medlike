import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/widgets/attach_files_button/attach_file_button.dart';
import 'package:medlike/modules/medcard/files/files_list.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_docs_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  final _listController = ScrollController();

  @override
  Widget build(BuildContext context) {
    void _onLoadDada({bool isRefresh = false}) {
      context
          .read<MedcardCubit>()
          .getUserFilesList(isRefresh: isRefresh, userId: widget.userId);
    }

    void _onFilterList(String filterStr) {
      context.read<MedcardCubit>().filterUserFilesList(filterStr);
    }

    void uploadFile({required File file}) {
      context
          .read<MedcardCubit>()
          .uploadFileFromDio(
              userId: widget.userId,
              fileName: file.path.split('/').last,
              file: file)
          .then((value) => {
                _listController.jumpTo(_listController.position.maxScrollExtent)
              });
    }

    void attachPickedFile({required PickedFile pickedFile}) {
      File attachedFile = File(pickedFile.path);
      uploadFile(file: attachedFile);
    }

    void attachFilePickerResult({required FilePickerResult filePickerResult}) {
      try {
        _listController.jumpTo(_listController.position.maxScrollExtent ?? 0);
      } catch (err) {}
      File attachedFile = File(filePickerResult.files.first.path as String);
      uploadFile(file: attachedFile);
    }

    void attachWebFile({
      required Uint8List fileBytes,
      required String fileName,
      required int size,
      required String fileType,
    }) {
      context
          .read<MedcardCubit>()
          .uploadFileFromDioForWeb(
            userId: widget.userId,
            fileName: fileName,
            fileBytes: fileBytes,
            size: size,
            fileType: fileType,
          )
          .then((value) => {
                _listController.jumpTo(_listController.position.maxScrollExtent)
              });
    }

    _onLoadDada();

    return DefaultScaffold(
      isChildrenPage: true,
      isSearch: true,
      filteringFunction: _onFilterList,
      appBarTitle: 'Файлы',
      // rightBottomWidget: AttachFileButton(
      //   attachPickedFile: attachPickedFile,
      //   attachFilePickerResult: attachFilePickerResult,
      //   attachFile: attachWebFile,
      // ),
      child: BlocBuilder<MedcardCubit, MedcardState>(
        builder: (context, state) {
          if (state.getMedcardUserFilesListStatus ==
              GetMedcardUserFilesListStatuses.failed) {
            return const Text('');
          } else if (state.getMedcardUserFilesListStatus ==
              GetMedcardUserFilesListStatuses.success) {
            return state.medcardUserFilesList!.isNotEmpty &&
                    state.filteredMedcardUserFilesList!.isEmpty
                ? const NotFoundData()
                : FilesList(
                    listController: _listController,
                    userFilesList: state.filteredMedcardUserFilesList
                        as List<MedcardUserFileModel>,
                    onRefreshData: _onLoadDada,
                    userId: widget.userId,
                    downloadingFileId: state.downloadingFileId as String,
                  );
          } else {
            return const MedcardDocsListSkeleton();
          }
        },
      ),
    );
  }
}

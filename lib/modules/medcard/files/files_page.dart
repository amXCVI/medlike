import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/files/attach_file_button.dart';
import 'package:medlike/modules/medcard/files/files_list.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_docs_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class FilesPage extends StatelessWidget {
  const FilesPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    void _onLoadDada({bool isRefresh = false}) {
      context
          .read<MedcardCubit>()
          .getUserFilesList(isRefresh: isRefresh, userId: userId);
    }

    void _onFilterList(String filterStr) {
      context.read<MedcardCubit>().filterUserFilesList(filterStr);
    }

    _onLoadDada();

    return DefaultScaffold(
      isChildrenPage: true,
      isSearch: true,
      filteringFunction: _onFilterList,
      appBarTitle: 'Файлы',
      rightBottomWidget: const AttachFileButton(),
      child: BlocBuilder<MedcardCubit, MedcardState>(
        builder: (context, state) {
          if (state.getMedcardUserFilesListStatus ==
              GetMedcardUserFilesListStatuses.failed) {
            return const Text('');
          } else if (state.getMedcardUserFilesListStatus ==
              GetMedcardUserFilesListStatuses.success) {
            return FilesList(
              userFilesList: state.filteredMedcardUserFilesList
                  as List<MedcardUserFileModel>,
              onRefreshData: _onLoadDada,
            );
          } else {
            return const MedcardDocsListSkeleton();
          }
        },
      ),
    );
  }
}

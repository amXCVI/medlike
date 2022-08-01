import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/files_button.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_docs_list_skeleton.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_list.dart';
import 'package:medlike/widgets/app_bar/medcard_app_bar/medcard_app_bar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class MedcardPage extends StatelessWidget {
  const MedcardPage(
      {Key? key, required this.userId, required this.isChildrenPage})
      : super(key: key);

  final String userId;
  final bool isChildrenPage;

  @override
  Widget build(BuildContext context) {
    void _onLoadDada({bool isRefresh = false}) {
      context
          .read<MedcardCubit>()
          .getMedcardDocsList(isRefresh: isRefresh, userId: userId);
    }

    void _onFilterList(String filterStr) {
      context.read<MedcardCubit>().filterMedcardDocsList(filterStr);
    }

    _onLoadDada();

    return DefaultScaffold(
        appBarTitle: 'Медкарта',
        appBar: MedcardAppBar(
          title: 'Медкарта',
          filteringFunction: _onFilterList,
          isChildrenPage: isChildrenPage,
        ),
        rightBottomWidget: FilesButton(userId: userId),
        child: BlocBuilder<MedcardCubit, MedcardState>(
          builder: (context, state) {
            if (state.getMedcardDocsListStatus ==
                GetMedcardDocsListStatuses.failed) {
              return const Text('');
            } else if (state.getMedcardDocsListStatus ==
                GetMedcardDocsListStatuses.success) {
              return MedcardList(
                medcardDocsList:
                    state.filteredMedcardDocsList as List<MedcardDocsModel>,
                onRefreshData: _onLoadDada,
                downloadingFileId: state.downloadingFileId ?? '',
              );
            } else {
              return const MedcardDocsListSkeleton();
            }
          },
        ));
  }
}

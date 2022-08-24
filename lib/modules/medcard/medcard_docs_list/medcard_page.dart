import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/files_button.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_docs_list_skeleton.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_filters_widget.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_list.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/selected_filters_widget.dart';
import 'package:medlike/widgets/app_bar/medcard_app_bar/medcard_app_bar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class MedcardPage extends StatefulWidget {
  const MedcardPage(
      {Key? key, required this.userId, required this.isChildrenPage})
      : super(key: key);

  final String userId;
  final bool isChildrenPage;

  @override
  State<MedcardPage> createState() => _MedcardPageState();
}

class _MedcardPageState extends State<MedcardPage> {
  late bool isFilteringMode = false;
  late bool isShowingFilters = false;
  GlobalKey widgetOverBodyGlobalKey = GlobalKey();

  @override
  void initState() {
    handleResetFilters();
    _onLoadDada();
    super.initState();
  }

  void handleTapOnFiltersButton() {
    if (isFilteringMode) {
      _onLoadDada();
      setState(() {
        isShowingFilters = true;
        isFilteringMode = false;
      });
    } else {
      setState(() {
        isFilteringMode = true;
      });
    }
  }

  void _onLoadDada({bool isRefresh = false}) {
    context
        .read<MedcardCubit>()
        .getMedcardDocsList(isRefresh: isRefresh, userId: widget.userId);
  }

  void handleResetFilters() {
    setState(() {
      isShowingFilters = false;
      isFilteringMode = false;
    });
    context.read<MedcardCubit>().resetMedcardFilters(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    void _onFilterList(String filterStr) {
      context.read<MedcardCubit>().filterMedcardDocsList(filterStr);
    }

    return DefaultScaffold(
        appBarTitle: 'Медкарта',
        isSearch: true,
        appBar: MedcardAppBar(
          title: 'Медкарта',
          filteringFunction: _onFilterList,
          isChildrenPage: widget.isChildrenPage,
          handleTapOnFiltersButton: handleTapOnFiltersButton,
          handleResetFilters: handleResetFilters,
          isFilteringMode: isFilteringMode,
        ),
        widgetOverBody: isFilteringMode
            ? MedcardFiltersWidget(key: widgetOverBodyGlobalKey)
            : GestureDetector(
                onTap: () {
                  handleTapOnFiltersButton();
                  ModalRoute.of(context)
                      ?.addLocalHistoryEntry(LocalHistoryEntry());
                },
                child: SelectedFiltersWidget(
                    key: widgetOverBodyGlobalKey,
                    isShowingWidget: isShowingFilters && !isFilteringMode),
              ),
        widgetOverBodyGlobalKey: isShowingFilters || isFilteringMode
            ? widgetOverBodyGlobalKey
            : null,
        rightBottomWidget: FilesButton(userId: widget.userId),
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

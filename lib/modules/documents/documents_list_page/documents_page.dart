import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/modules/documents/documents_list_page/documents_list.dart';
import 'package:medlike/modules/documents/documents_list_page/documents_list_filter.dart';
import 'package:medlike/modules/documents/documents_list_page/selected_filters_widget.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/app_bar/medcard_app_bar/medcard_app_bar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'documents_list_skeleton.dart';

@RoutePage()
class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
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
    context.read<DocumentsCubit>().getDocumentsList(isRefresh: isRefresh);
  }

  void handleResetFilters() {
    setState(() {
      isShowingFilters = false;
      isFilteringMode = false;
    });
    context.read<DocumentsCubit>().resetDocumentsFilters();
  }

  void _filteringDocuments(String str) {
    context.read<DocumentsCubit>().filterDocumentsList(str);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.router.push(const MainRoute());
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Мои документы',
        isSearch: true,
        filteringFunction: _filteringDocuments,
        appBar: MedcardAppBar(
          title: 'Мои документы',
          filteringFunction: _filteringDocuments,
          isChildrenPage: true,
          handleTapOnFiltersButton: handleTapOnFiltersButton,
          handleResetFilters: handleResetFilters,
          isFilteringMode: isFilteringMode,
        ),
        widgetOverBody: isFilteringMode
            ? DocumentsFiltersWidget(key: widgetOverBodyGlobalKey)
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
        child: BlocBuilder<DocumentsCubit, DocumentsState>(
          builder: (context, state) {
            if (state.getDocumentsListStatus ==
                GetDocumentsListStatuses.failed) {
              return const Text('');
            } else if (state.getDocumentsListStatus ==
                GetDocumentsListStatuses.success) {
              return DocumentsList(
                documentsList:
                    state.filteredDocumentsList as List<DocumentModel>,
                onRefreshData: _onLoadDada,
              );
            } else {
              return const DocumentsListSkeleton();
            }
          },
        ),
      ),
    );
  }
}

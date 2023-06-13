import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/modules/documents/documents_list_page/documents_item.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class DocumentsList extends StatelessWidget {
  const DocumentsList({
    Key? key,
    required this.documentsList,
    this.onRefreshData,
  }) : super(key: key);

  final List<DocumentModel> documentsList;
  final dynamic onRefreshData;

  @override
  Widget build(BuildContext context) {
    void _handleTapOnDocumentItem(DocumentModel doc) async {
      context.router.push(DocumentRoute(document: doc));
    }

    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: documentsList.isEmpty
          ? const EmptyListWidget(
              label: 'Здесь будет список ваших медицинских документов',
              imgPath: 'assets/images/empty_medcard.png',
            )
          : DefaultScrollbar(
              child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  children: documentsList
                      .map((item) => DocumentItem(
                            documentItem: item,
                            onTap: () {
                              _handleTapOnDocumentItem(item);
                            },
                          ))
                      .toList()),
            ),
    );
  }
}

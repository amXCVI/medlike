import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/modules/documents/document_detail_page/document_header.dart';
import 'package:medlike/modules/documents/document_detail_page/pdf_viewer.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

@RoutePage()
class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key, required this.document}) : super(key: key);

  final DocumentModel document;

  void _handleSubscribeDocument() {}

  bool _checkIsSubscribedDoc() {
    bool result = DocumentStatuses.getStatus(document.status).isSubscribed;
    return !result;
  }

  @override
  Widget build(BuildContext context) {
    void getDocumentData() {
      context
          .read<DocumentsCubit>()
          .getDocumentMeta(documentId: document.documentURL);
    }

    getDocumentData();

    return DefaultScaffold(
        appBarTitle: document.documentName,
        actionButton: _checkIsSubscribedDoc()
            ? FloatingActionButton.extended(
                onPressed: _handleSubscribeDocument,
                label: Text(
                  'Подписать'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            : const SizedBox(),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: [
            DocumentHeader(
              documentName: document.documentName,
              status: document.status,
              date: document.documentCreateDate,
              userName: document.userName,
            ),
            PdfViewerWidget(
              fileId: document.documentName,
              pdfUrl:
                  '${ApiConstants.baseUrl}/api/v1.0/profile/document/118b27ff-667e-4a33-9330-456aadcc5390/content',
            )
          ],
        ));
  }
}

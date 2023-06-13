import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/modules/documents/document_detail_page/document_header.dart';
import 'package:medlike/modules/documents/document_detail_page/pdf_viewer.dart';
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
            const PdfViewer(
              pdfUrl: 'https://www.africau.edu/images/default/sample.pdf',
            )
          ],
        ));
  }
}

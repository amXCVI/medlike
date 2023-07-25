import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/documents/document_detail_page/document_header.dart';
import 'package:medlike/modules/documents/document_detail_page/pdf_viewer.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

@RoutePage()
class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key, required this.document}) : super(key: key);

  final DocumentModel document;

  void _handleSubscribeDocument({
    required BuildContext context,
    required String documentId,
    required String userId,
    required String lpuId,
  }) {
    String esiaToken = context.read<UserCubit>().getEsiaToken();
    context.read<DocumentsCubit>().subscribeDocument(
          documentId: documentId,
          userId: userId,
          lpuId: lpuId,
          esiaToken: esiaToken,
        );
  }

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
            ? BlocBuilder<DocumentsCubit, DocumentsState>(
                builder: (context, state) {
                  return FloatingActionButton.extended(
                      onPressed: () => _handleSubscribeDocument(
                            context: context,
                            documentId: state.selectedDocumentMetaData!.id,
                            userId: '',
                            lpuId: '',
                          ),
                      label: ActionButtonWidget(
                        subscribeDocumentStatuses:
                            state.subscribeDocumentStatuses,
                      ));
                },
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
                  '${ApiConstants.baseUrl}/api/v1.0/profile/document/${document.documentURL}/content',
            )
          ],
        ));
  }
}

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({Key? key, required this.subscribeDocumentStatuses})
      : super(key: key);

  final SubscribeDocumentStatuses? subscribeDocumentStatuses;

  @override
  Widget build(BuildContext context) {
    if (subscribeDocumentStatuses == SubscribeDocumentStatuses.failed) {
      return const Text('Ошибочка');
    } else if (subscribeDocumentStatuses == SubscribeDocumentStatuses.loading) {
      return const CircularLoader();
    } else if (subscribeDocumentStatuses == SubscribeDocumentStatuses.success) {
      return const Text('Подписано');
    } else {
      return Text(
        'Подписать'.toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall,
      );
    }
  }
}

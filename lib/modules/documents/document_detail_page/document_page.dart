import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/documents/document_detail_page/document_header.dart';
import 'package:medlike/modules/documents/document_detail_page/pdf_viewer.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

@RoutePage()
class DocumentPage extends StatelessWidget {
  const DocumentPage(
      {Key? key, required this.document, this.isFromEsiaAuthPage = false})
      : super(key: key);

  final DocumentModel document;
  final bool
      isFromEsiaAuthPage; // Если страница уже просмотрена, чел начал подписывать док и ушел в авторизацию

  void _handleSubscribeDocument({
    required BuildContext context,
    required String documentId,
    required String userId,
    required String lpuId,
  }) {
    String esiaToken = context.read<UserCubit>().getEsiaToken();

    if (esiaToken == 'null' || esiaToken.isEmpty) {
      AppToast.showAppToast(
          msg:
              'Для подписания документа пожалуйста войдите в систему через госуслуги');
      context.router.push(EsiaLoginRoute(
        isFromSubscribeDoc: true,
        subscribedDocument: document,
      ));
      return;
    }

    context.read<DocumentsCubit>().subscribeDocument(
          documentId: documentId,
          userId: userId,
          lpuId: lpuId,
          esiaToken: esiaToken,
        );
  }

  @override
  Widget build(BuildContext context) {
    void getDocumentData() {
      context.read<DocumentsCubit>().getDocumentMeta(documentId: document.id);
    }

    getDocumentData();

    return DefaultScaffold(
        appBarTitle: document.name,
        actionButton: !document.isSignByPatient
            ? BlocBuilder<DocumentsCubit, DocumentsState>(
                builder: (context, state) {
                  return FloatingActionButton.extended(
                      onPressed: () => _handleSubscribeDocument(
                            context: context,
                            documentId: document.id,
                            userId: context.read<UserCubit>().getFirstProfile(),
                            lpuId: document.lpu.id,
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
              documentName: document.name,
              statusStr: DocumentStatuses.getStatus(
                isSignByPatient: document.isSignByPatient,
                isSignByEmployee: document.isSignByEmployee,
              ).statusName,
              signedByPatientAt: document.signedByPatientAt,
              userName: document.signEmployer != null
                  ? document.signEmployer!.firstname
                  : '',
            ),
            PdfViewerWidget(
              fileId: document.id,
              pdfUrl:
                  '${ApiConstants.baseUrl}/api/v1.0/profile/documents/${document.id}/content',
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

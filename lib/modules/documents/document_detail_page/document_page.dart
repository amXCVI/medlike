import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/constants/sign_types.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/documents/document_detail_page/clinic_widget.dart';
import 'package:medlike/modules/documents/document_detail_page/document_header.dart';
import 'package:medlike/modules/documents/document_detail_page/patient_widget.dart';
import 'package:medlike/modules/documents/document_detail_page/pdf_viewer.dart';
import 'package:medlike/modules/documents/get_last_date.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

@RoutePage()
class DocumentPage extends StatefulWidget {
  const DocumentPage(
      {Key? key, required this.document, this.isFromEsiaAuthPage = false})
      : super(key: key);

  final DocumentModel document;
  final bool isFromEsiaAuthPage;
  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final bool isSubscribedDoc = false;
  // Если страница уже просмотрена, чел начал подписывать док и ушел в авторизацию
  void goToEsiaAuth(BuildContext context) {
    AppToast.showAppToast(
        msg:
            'Для подписания документа пожалуйста войдите в систему через госуслуги');
    context.router.push(EsiaLoginRoute(
      isFromSubscribeDoc: true,
      subscribedDocument: widget.document,
    ));
  }

  Future<void> _handleSubscribeDocument({
    required BuildContext context,
    required String documentId,
    required String userId,
    required String lpuId,
  }) async {
    String esiaToken = context.read<UserCubit>().getEsiaToken();

    if (esiaToken == 'null' || esiaToken.isEmpty) {
      goToEsiaAuth(context);
      return;
    }

    await context
        .read<DocumentsCubit>()
        .subscribeDocument(
          documentId: documentId,
          userId: userId,
          lpuId: lpuId,
          esiaToken: esiaToken,
        )
        .then((value) {
      if (value) {}
    }).catchError((onError) {
      if (onError.toString().contains('501')) {
        goToEsiaAuth(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void getDocumentData() {
      context
          .read<DocumentsCubit>()
          .getDocumentMeta(documentId: widget.document.id)
          .then((res) {
        if (!res) {
          context.router.pop();
        }
      }).catchError((onError) {
        if (onError.toString().contains('404')) {
          context.router.pop();
        }
      });
    }

    getDocumentData();

    return BlocBuilder<DocumentsCubit, DocumentsState>(
        builder: (context, state) {
      return WillPopScope(
        onWillPop: () async {
          context.router.push(const DocumentsRoute());
          return false;
        },
        child: DefaultScaffold(
            appBarTitle: widget.document.name,
            actionButton: state.selectedDocumentMetaData != null &&
                    !state.selectedDocumentMetaData!.isSignByPatient
                ? FloatingActionButton.extended(
                    onPressed: () => _handleSubscribeDocument(
                          context: context,
                          documentId: widget.document.id,
                          userId: context.read<UserCubit>().getFirstProfile(),
                          lpuId: widget.document.lpu.id,
                        ),
                    label: ActionButtonWidget(
                      subscribeDocumentStatuses:
                          state.subscribeDocumentStatuses,
                      isSignByPatient:
                          state.selectedDocumentMetaData?.isSignByPatient ??
                              false,
                    ))
                : const SizedBox(),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              children: [
                DocumentHeader(
                  documentName: widget.document.name,
                  statusStr: DocumentStatuses.getStatus(
                    isSignByPatient:
                        state.selectedDocumentMetaData?.isSignByPatient ??
                            false,
                    isSignByClinic: widget.document.isSignByClinic,
                  ).statusName,
                  updatedAt: getLastDate(
                    dateOne: widget.document.updatedAt,
                    dateTwo: widget.document.signedByEmployeeAt,
                    dateThree: widget.document.signedByPatientAt,
                  ),
                  userName: state.selectedDocumentMetaData != null
                      ? '${state.selectedDocumentMetaData!.patient.firstname} ${state.selectedDocumentMetaData!.patient.lastname[0]}.'
                      : '',
                ),
                const SizedBox(height: 32),
                PatientWidget(
                  patient: state.selectedDocumentMetaData?.patient,
                  patientSignUrl: '',
                  isLoadingData: state.getDocumentMetaStatus ==
                      GetDocumentMetaStatuses.loading,
                  isSignByPatient: state.selectedDocumentMetaData != null &&
                          SignTypes.getSignTypeById(
                                      state.selectedDocumentMetaData?.signType)
                                  .signTypeId ==
                              4
                      ? state.selectedDocumentMetaData!.isSignByPatient
                      : false,
                ),
                const SizedBox(height: 32),
                ClinicWidget(
                  clinic: state.selectedDocumentMetaData?.lpu,
                  documentCreator:
                      state.selectedDocumentMetaData?.documentCreator,
                  isLoadingData: state.getDocumentMetaStatus ==
                      GetDocumentMetaStatuses.loading,
                  isSignByClinic: state.selectedDocumentMetaData != null
                      ? state.selectedDocumentMetaData!.isSignByClinic
                      : false,
                  isSignByEmployee: state.selectedDocumentMetaData != null
                      ? state.selectedDocumentMetaData!.isSignByEmployee
                      : false,
                  signClinic: state.selectedDocumentMetaData?.signClinic,
                  signEmployee: state.selectedDocumentMetaData?.signEmployee,
                ),
                const SizedBox(height: 32),
                Text(
                  'Документ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                PdfViewerWidget(
                  fileId: widget.document.id,
                  pdfUrl:
                      '${ApiConstants.baseUrl}/api/v1.0/profile/documents/${widget.document.id}/content',
                  fileName: widget.document.name,
                )
              ],
            )),
      );
    });
  }
}

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    Key? key,
    required this.subscribeDocumentStatuses,
    required this.isSignByPatient,
  }) : super(key: key);

  final SubscribeDocumentStatuses? subscribeDocumentStatuses;
  final bool isSignByPatient;

  @override
  Widget build(BuildContext context) {
    if (subscribeDocumentStatuses == SubscribeDocumentStatuses.failed) {
      return const Text('Подписать');
    } else if (subscribeDocumentStatuses == SubscribeDocumentStatuses.loading) {
      return const CircularLoader();
    } else if (subscribeDocumentStatuses == SubscribeDocumentStatuses.success &&
        isSignByPatient) {
      return const Text('Подписано');
    } else {
      return Text(
        'Подписать'.toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall,
      );
    }
  }
}

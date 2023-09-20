import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/data/repository/documents_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/cache_manager/custom_cache_maneger.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

part 'documents_state.dart';

class DocumentsCubit extends MediatorCubit<DocumentsState, UserMediatorEvent>
    with RefreshErrorHandler<DocumentsState, UserCubit> {
  DocumentsCubit(this.documentsRepository, mediator)
      : super(const DocumentsState(), mediator) {
    mediator.register(this);
  }

  @override
  void receive(String from, UserMediatorEvent event) {
    throw UnimplementedError();
  }

  final DocumentsRepository documentsRepository;
  var cacheManager = CustomCacheManager.instance;

  /// Получает список документов пользователя
  void getDocumentsList({required bool isRefresh}) async {
    if (state.getDocumentsListStatus == GetDocumentsListStatuses.loading) {
      return;
    }
    emit(state.copyWith(
      getDocumentsListStatus: GetDocumentsListStatuses.loading,
    ));
    try {
      final List<DocumentModel> response;
      response = await documentsRepository.getDocumentsList();
      emit(state.copyWith(
        getDocumentsListStatus: GetDocumentsListStatuses.success,
        documentsList: response,
        filteredDocumentsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getDocumentsListStatus: GetDocumentsListStatuses.failed));
    }
  }

  /// Изменить набор фильтров
  void changeDocumentsFilters({
    required DocumentFilterItemModel filterItem,
    required String categoryValue,
  }) {
    Map<String, DocumentFilterItemModel> documentsFilters =
        state.documentsSelectedFilters as Map<String, DocumentFilterItemModel>;
    documentsFilters.remove(categoryValue);
    documentsFilters[categoryValue] = filterItem;

    final List<DocumentModel> filteredList;
    if (filterItem.value != '') {
      filteredList = state.documentsList!
          .where((element) => documentsFilters.entries
              .map((e) => e.value.value)
              .contains(DocumentStatuses.getStatus(
                isSignByClinic: element.isSignByEmployee,
                isSignByPatient: element.isSignByPatient,
              ).filterValue))
          .toList();
    } else {
      filteredList = state.documentsList ?? [];
    }

    emit(state.copyWith(
      documentsSelectedFilters: documentsFilters,
      filteredDocumentsList: filteredList,
    ));
  }

  /// Сбросить фильтры
  void resetDocumentsFilters() {
    emit(state.copyWith(
      documentsSelectedFilters: <String, DocumentFilterItemModel>{},
    ));
    getDocumentsList(isRefresh: true);
  }

  /// Поиск / фильтрация документов по имени
  void filterDocumentsList(String filterStr) {
    final List<DocumentModel> filteredList;
    filteredList = state.documentsList!
        .where((element) =>
            element.name.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredDocumentsList: filteredList,
    ));
  }

  /// Получает документ пользователя по id
  Future<bool> getDocumentMeta({required String documentId}) async {
    emit(state.copyWith(
      getDocumentMetaStatus: GetDocumentMetaStatuses.loading,
    ));
    try {
      final DocumentMetaModel response;
      response =
          await documentsRepository.getDocumentMetaData(documentId: documentId);
      emit(state.copyWith(
        getDocumentMetaStatus: GetDocumentMetaStatuses.success,
        selectedDocumentMetaData: response,
      ));
      return true;
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getDocumentMetaStatus: GetDocumentMetaStatuses.failed));
      rethrow;
    }
  }

  /// Получение документа по url
  Future<File> getDocumentByUrl(String fileUrl) async {
    try {
      File file = await cacheManager.getSingleFile(
        fileUrl,
        // key: fileUrl,
        headers: {
          'Authorization':
              'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
        },
      );
      return file;
    } catch (err) {
      rethrow;
    }
  }

  /// Отправить документ на подпись (нужен токен есиа)
  Future<bool> subscribeDocument({
    required String documentId,
    required String userId,
    required String lpuId,
    required String esiaToken,
  }) async {
    emit(state.copyWith(
      subscribeDocumentStatuses: SubscribeDocumentStatuses.loading,
    ));
    try {
      await documentsRepository.subscribeDocument(
        documentId: documentId,
        userId: userId,
        lpuId: lpuId,
        esiaToken: esiaToken,
      );
      emit(state.copyWith(
        subscribeDocumentStatuses: SubscribeDocumentStatuses.success,
        selectedDocumentMetaData:
            state.selectedDocumentMetaData?.copyWith(isSignByPatient: true),
        documentsList: state.documentsList!.map((e) {
          return e.id == documentId ? e.copyWith(isSignByPatient: true) : e;
        }).toList(),
        filteredDocumentsList: state.filteredDocumentsList!.map((e) {
          return e.id == documentId ? e.copyWith(isSignByPatient: true) : e;
        }).toList(),
      ));
      Future.delayed(const Duration(seconds: 5), () {
        emit(
          state.copyWith(
            subscribeDocumentStatuses: SubscribeDocumentStatuses.initial,
          ),
        );
      });
      return true;
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          subscribeDocumentStatuses: SubscribeDocumentStatuses.failed));
      rethrow;
    }
  }
}

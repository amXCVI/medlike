import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/data/repository/documents_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/modules/documents/documents_mock.dart';
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
      response = documentsMock;
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
              .contains(DocumentStatuses.getStatus(element.status).filterValue))
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
        .where((element) => element.documentName
            .toLowerCase()
            .contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredDocumentsList: filteredList,
    ));
  }

  /// Получение документа по url
  Future<File> getDocumentByUrl(String fileUrl) async {
    try {
      File file = await DefaultCacheManager().getSingleFile(
        fileUrl,
        key: fileUrl,
        headers: {
          'Authorization':
              'Bearer ${UserSecureStorage.getField(AppConstants.accessToken)}'
        },
      );
      return file;
    } catch (err) {
      rethrow;
    }
  }
}

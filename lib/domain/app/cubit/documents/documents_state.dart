part of 'documents_cubit.dart';

enum GetDocumentsListStatuses { initial, loading, success, failed }

enum GetDocumentMetaStatuses { initial, loading, success, failed }

@immutable
class DocumentsState {
  final GetDocumentsListStatuses? getDocumentsListStatus;
  final Map<String, DocumentFilterItemModel>? documentsSelectedFilters;
  final List<DocumentModel>? documentsList;
  final List<DocumentModel>? filteredDocumentsList;
  final GetDocumentMetaStatuses? getDocumentMetaStatus;
  final DocumentMetaModel? selectedDocumentMetaData;

  const DocumentsState({
    this.getDocumentsListStatus = GetDocumentsListStatuses.initial,
    this.documentsSelectedFilters,
    this.documentsList,
    this.filteredDocumentsList,
    this.getDocumentMetaStatus,
    this.selectedDocumentMetaData,
  });

  DocumentsState copyWith({
    GetDocumentsListStatuses? getDocumentsListStatus,
    Map<String, DocumentFilterItemModel>? documentsSelectedFilters,
    List<DocumentModel>? documentsList,
    final List<DocumentModel>? filteredDocumentsList,
    GetDocumentMetaStatuses? getDocumentMetaStatus,
    DocumentMetaModel? selectedDocumentMetaData,
  }) {
    return DocumentsState(
      getDocumentsListStatus:
          getDocumentsListStatus ?? this.getDocumentsListStatus,
      documentsSelectedFilters:
          documentsSelectedFilters ?? this.documentsSelectedFilters,
      documentsList: documentsList ?? this.documentsList,
      filteredDocumentsList:
          filteredDocumentsList ?? this.filteredDocumentsList,
      getDocumentMetaStatus:
          getDocumentMetaStatus ?? this.getDocumentMetaStatus,
      selectedDocumentMetaData:
          selectedDocumentMetaData ?? this.selectedDocumentMetaData,
    );
  }

  List<Object?> get props => [];
}

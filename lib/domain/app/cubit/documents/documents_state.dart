part of 'documents_cubit.dart';

enum GetDocumentsListStatuses { initial, loading, success, failed }

@immutable
class DocumentsState {
  final GetDocumentsListStatuses? getDocumentsListStatus;
  final Map<String, DocumentFilterItemModel>? documentsSelectedFilters;
  final List<DocumentModel>? documentsList;
  final List<DocumentModel>? filteredDocumentsList;

  const DocumentsState({
    this.getDocumentsListStatus = GetDocumentsListStatuses.initial,
    this.documentsSelectedFilters,
    this.documentsList,
    this.filteredDocumentsList,
  });

  DocumentsState copyWith({
    GetDocumentsListStatuses? getDocumentsListStatus,
    Map<String, DocumentFilterItemModel>? documentsSelectedFilters,
    List<DocumentModel>? documentsList,
    final List<DocumentModel>? filteredDocumentsList,
  }) {
    return DocumentsState(
      getDocumentsListStatus:
          getDocumentsListStatus ?? this.getDocumentsListStatus,
      documentsSelectedFilters:
          documentsSelectedFilters ?? this.documentsSelectedFilters,
      documentsList: documentsList ?? this.documentsList,
      filteredDocumentsList:
          filteredDocumentsList ?? this.filteredDocumentsList,
    );
  }

  List<Object?> get props => [];
}

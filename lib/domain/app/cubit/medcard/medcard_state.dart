part of 'medcard_cubit.dart';

enum GetMedcardDocsListStatuses { initial, loading, success, failed }
enum GetMedcardUserFilesListStatuses { initial, loading, success, failed }
enum DownloadMedcardDocumentStatuses { initial, loading, success, failed }

@immutable
class MedcardState {
  final GetMedcardDocsListStatuses? getMedcardDocsListStatus;
  final List<MedcardDocsModel>? medcardDocsList;
  final List<MedcardDocsModel>? filteredMedcardDocsList;
  final GetMedcardUserFilesListStatuses? getMedcardUserFilesListStatus;
  final List<MedcardUserFileModel>? medcardUserFilesList;
  final List<MedcardUserFileModel>? filteredMedcardUserFilesList;
  final DownloadMedcardDocumentStatuses? downloadMedcardDocumentStatus;

  const MedcardState({
    this.getMedcardDocsListStatus = GetMedcardDocsListStatuses.initial,
    this.medcardDocsList,
    this.filteredMedcardDocsList,
    this.getMedcardUserFilesListStatus,
    this.medcardUserFilesList,
    this.filteredMedcardUserFilesList,
    this.downloadMedcardDocumentStatus,
  });

  MedcardState copyWith({
    GetMedcardDocsListStatuses? getMedcardDocsListStatus,
    List<MedcardDocsModel>? medcardDocsList,
    List<MedcardDocsModel>? filteredMedcardDocsList,
    GetMedcardUserFilesListStatuses? getMedcardUserFilesListStatus,
    List<MedcardUserFileModel>? medcardUserFilesList,
    List<MedcardUserFileModel>? filteredMedcardUserFilesList,
    DownloadMedcardDocumentStatuses? downloadMedcardDocumentStatus,
  }) {
    return MedcardState(
      getMedcardDocsListStatus:
          getMedcardDocsListStatus ?? this.getMedcardDocsListStatus,
      medcardDocsList: medcardDocsList ?? this.medcardDocsList,
      filteredMedcardDocsList:
          filteredMedcardDocsList ?? this.filteredMedcardDocsList,
      getMedcardUserFilesListStatus:
          getMedcardUserFilesListStatus ?? this.getMedcardUserFilesListStatus,
      medcardUserFilesList: medcardUserFilesList ?? this.medcardUserFilesList,
      filteredMedcardUserFilesList:
          filteredMedcardUserFilesList ?? this.filteredMedcardUserFilesList,
      downloadMedcardDocumentStatus:
          downloadMedcardDocumentStatus ?? this.downloadMedcardDocumentStatus,
    );
  }

  List<Object?> get props => [];
}

part of 'medcard_cubit.dart';

enum GetMedcardDocsListStatuses { initial, loading, success, failed }

@immutable
class MedcardState {
  final GetMedcardDocsListStatuses? getMedcardDocsListStatus;
  final List<MedcardDocsModel>? medcardDocsList;
  final List<MedcardDocsModel>? filteredMedcardDocsList;

  const MedcardState({
    this.getMedcardDocsListStatus = GetMedcardDocsListStatuses.initial,
    this.medcardDocsList,
    this.filteredMedcardDocsList,
  });

  MedcardState copyWith(
      {GetMedcardDocsListStatuses? getMedcardDocsListStatus,
      List<MedcardDocsModel>? medcardDocsList,
      List<MedcardDocsModel>? filteredMedcardDocsList}) {
    return MedcardState(
        getMedcardDocsListStatus:
            getMedcardDocsListStatus ?? this.getMedcardDocsListStatus,
        medcardDocsList: medcardDocsList ?? this.medcardDocsList,
        filteredMedcardDocsList:
            filteredMedcardDocsList ?? this.filteredMedcardDocsList,
    );
  }

  List<Object?> get props => [];
}

class SignTypes {
  static List<SignType> signTypes = [
    SignType(0, 'Неизвестно кто'),
    SignType(4, 'ЛК'),
    SignType(5, 'Планшет'),
  ];

  static SignType getSignTypeById(int? signTypeId) {
    SignType findSignType =
        signTypes.firstWhere((signType) => signType.signTypeId == signTypeId);
    return findSignType ?? signTypes[0];
  }
}

class SignType {
  final int signTypeId;
  final String signTypeLabel;

  SignType(
    this.signTypeId,
    this.signTypeLabel,
  );
}

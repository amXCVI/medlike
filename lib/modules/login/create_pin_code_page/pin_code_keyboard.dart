enum PinCodeKeyboardTypes { number, empty, svgPicture, biometric }

class PinCodeKeyboardItem {
  final String? imgSrc;
  final String? imgSrcTouchId;
  final String? imgSrcFaceId;
  final int label;
  final PinCodeKeyboardTypes buttonType;

  PinCodeKeyboardItem({
    this.imgSrcTouchId,
    this.imgSrcFaceId,
    this.imgSrc,
    required this.label,
    required this.buttonType,
  });
}

List<PinCodeKeyboardItem> keyboardList = [
  PinCodeKeyboardItem(label: 1, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 2, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 3, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 4, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 5, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 6, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 7, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 8, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(label: 9, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(
      label: -1,
      imgSrcTouchId: 'assets/icons/login/ic_fingerprint_pass.svg',
      imgSrcFaceId: 'assets/icons/login/ic_faceid_setting_outline.svg',
      buttonType: PinCodeKeyboardTypes.biometric),
  PinCodeKeyboardItem(label: 0, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(
      label: -1,
      imgSrc: 'assets/icons/login/button_del.svg',
      buttonType: PinCodeKeyboardTypes.svgPicture),
];

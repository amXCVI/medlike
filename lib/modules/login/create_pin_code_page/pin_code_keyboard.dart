enum PinCodeKeyboardTypes { number, empty, svgPicture }

class PinCodeKeyboardItem {
  final String? imgSrc;
  final int label;
  final PinCodeKeyboardTypes buttonType;

  PinCodeKeyboardItem({
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
  PinCodeKeyboardItem(label: -1, buttonType: PinCodeKeyboardTypes.empty),
  PinCodeKeyboardItem(label: 0, buttonType: PinCodeKeyboardTypes.number),
  PinCodeKeyboardItem(
      label: -1,
      imgSrc: 'assets/icons/login/button_del.svg',
      buttonType: PinCodeKeyboardTypes.svgPicture),
];

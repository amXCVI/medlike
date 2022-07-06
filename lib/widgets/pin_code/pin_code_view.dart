import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/modules/login/create_pin_code_page/pin_code_keyboard.dart';
import 'package:medlike/themes/colors.dart';

class PinCodeView extends StatefulWidget {
  const PinCodeView({Key? key, required this.setPinCode}) : super(key: key);
  final void Function(List<int> pin) setPinCode;

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  late final List<int> pointsArray;

  @override
  void initState() {
    super.initState();
    pointsArray = [-1, -1, -1, -1, -1];
  }

  void onChangePointsArray(PinCodeKeyboardItem e) {
    HapticFeedback.vibrate();
    int firstEmptyIndex = pointsArray.indexOf(-1);

    if (e.buttonType == PinCodeKeyboardTypes.number) {
      if (firstEmptyIndex != -1) {
        setState(() {
          pointsArray[firstEmptyIndex] = e.label;
        });
      }
    } else {
      if (firstEmptyIndex != -1 && firstEmptyIndex != 0) {
        setState(() {
          pointsArray[firstEmptyIndex - 1] = -1;
        });
      } else {
        setState(() {
          pointsArray.last = -1;
        });
      }
    }

    if (firstEmptyIndex == pointsArray.length - 1) {
      widget.setPinCode(pointsArray);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...pointsArray
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: e == -1
                                ? AppColors.circleBgFirst
                                : Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
        const SizedBox(height: 44),
        Material(
          color: Theme.of(context).backgroundColor,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              ...keyboardList
                  .map((item) => item.buttonType == PinCodeKeyboardTypes.empty
                      ? const SizedBox()
                      : InkWell(
                          onTap: () => {onChangePointsArray(item)},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: item.buttonType ==
                                    PinCodeKeyboardTypes.svgPicture
                                ? Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                        item.imgSrc as String,
                                        width: 34),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: AppColors.mainText),
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.label.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(
                                                color: AppColors.mainText,
                                                fontSize: 28,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                          ),
                        ))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}

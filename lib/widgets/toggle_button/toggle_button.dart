import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.itemsList,
    required this.setValue,
    required this.value,
  });

  final List<String> itemsList;
  final Function(String) setValue;
  final String value;

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

const double height = 32.0;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class ToggleButtonState extends State<ToggleButton> {
  late double xAlign;

  @override
  void initState() {
    super.initState();
    xAlign = (2 / (widget.itemsList.length - 1)) *
            widget.itemsList.indexOf(widget.value).toDouble() -
        1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.circleBgFirst,
        borderRadius: BorderRadius.all(
          Radius.circular(height / 2),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width:
                  MediaQuery.of(context).size.width / widget.itemsList.length,
              height: height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(height / 2),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          ...widget.itemsList
              .asMap()
              .entries
              .map((e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign =
                            (2 / (widget.itemsList.length - 1)) * e.key - 1;
                      });
                      widget.setValue(e.value);
                    },
                    child: Align(
                      alignment: Alignment(
                          (2 / (widget.itemsList.length - 1)) * e.key - 1, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width /
                            widget.itemsList.length,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          e.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: xAlign ==
                                          (2 / (widget.itemsList.length - 1)) *
                                                  e.key -
                                              1
                                      ? FontWeight.w500
                                      : FontWeight.w400),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

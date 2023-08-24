import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/themes/colors.dart';

class RatingStarsWidget extends StatefulWidget {
  const RatingStarsWidget(
      {Key? key, required this.ratingValue, required this.setRating})
      : super(key: key);

  final int ratingValue;
  final void Function(int e) setRating;

  @override
  State<RatingStarsWidget> createState() => _RatingStarsWidgetState();
}

class _RatingStarsWidgetState extends State<RatingStarsWidget> {
  List<int> starsArray = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...starsArray.map((e) => GestureDetector(
              onTap: () => widget.setRating(e),
              child: StarItem(
                isFilled: e < widget.ratingValue,
                index: e,
              ),
            ))
      ],
    );
  }
}

class StarItem extends StatelessWidget {
  const StarItem({Key? key, required this.isFilled, required this.index})
      : super(key: key);

  final bool isFilled;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 10.0, top: 8.0),
        child: SvgPicture.asset(
          'assets/icons/appointments/union.svg',
          colorFilter: isFilled
              ? const ColorFilter.linearToSrgbGamma()
              : const ColorFilter.mode(
                  AppColors.mainSeparatorAlpha, BlendMode.srcIn),
        ),
      ),
    );
  }
}

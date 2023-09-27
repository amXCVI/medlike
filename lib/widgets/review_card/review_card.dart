import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';
import 'package:medlike/widgets/doctor_rating/doctor_rating.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  final DoctorInfoReviewModel review;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool _isOverflown = false;

  @override
  void initState() {
    super.initState();
  }

  bool _hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _isOverflown = _hasTextOverflow(widget.review.message ?? "",
          Theme.of(context).textTheme.bodySmall ?? TextStyle(),
          maxLines: 3, maxWidth: MediaQuery.of(context).size.width);
    });
    return Padding(
      padding: EdgeInsets.only(
          top: 16.0, bottom: widget.review.message != null ? 4.0 : 0),
      child: Column(
        children: [
          Row(
            children: [
              CircleUserAvatar(
                userId: widget.review.peopleId ?? "",
                userAvatar: null,
                userName: widget.review.fio ?? '',
                radius: 15,
                review: true,
              ),
              const SizedBox(width: 8),
              Text(
                widget.review.fio ?? 'Аноним',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.mainText, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              DoctorRating(rating: widget.review.rate),
            ],
          ),
          const SizedBox(height: 4),
          widget.review.message != null
              ? GestureDetector(
                  onTap: () {
                    _isOverflown
                        ? showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              ),
                            ),
                            context: context,
                            builder: (context) => SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, right: 16, bottom: 16, left: 16),
                                child: Wrap(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 12.0, bottom: 16.0),
                                            height: 5,
                                            width: 30,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                              color:
                                                  AppColors.mainSeparatorAlpha,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              widget.review.fio ?? 'Аноним',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                            const Spacer(),
                                            DoctorRating(
                                                rating: widget.review.rate),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        SingleChildScrollView(
                                            child: Text(
                                          widget.review.message ?? "",
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : () {}();
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 24),
                      Expanded(
                        child: Text(
                          widget.review.message ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      _isOverflown
                          ? Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                  "assets/icons/subscribe/right_arrow_icon.svg"),
                            )
                          : const SizedBox(),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

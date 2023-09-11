import 'package:flutter/material.dart';
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
  bool isExpandedReview = false;

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      isExpandedReview = !isExpandedReview;
                    });
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 24),
                      Expanded(
                        child: Text(
                          widget.review.message ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: isExpandedReview ? 100 : 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

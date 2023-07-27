import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({Key? key, required this.review}) : super(key: key);

  final AppointmentReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Отзыв',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/appointments/ic_rating.svg'),
                  const SizedBox(width: 8),
                  Text(
                    'Публичный отзыв',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                      'assets/icons/appointments/raiting_gold_star.svg'),
                  const SizedBox(width: 6),
                  Text(review.rate.toString())
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () => {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 24, right: 16, bottom: 32),
                          child: Text(review.message),
                        ))
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 24.0),
                  Flexible(
                      child: Text(
                    review.message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: true,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/widgets/doctor_rating/doctor_rating.dart';

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
                    review.visibility == 1
                        ? 'Публичный отзыв'
                        : 'Скрытый отзыв',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              DoctorRating(rating: review.rate),
            ],
          ),
          const SizedBox(height: 16),
          Row(
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
              SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg')
            ],
          ),
        ],
      ),
    );
  }
}

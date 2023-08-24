import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/review_card/review_card.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({Key? key, required this.reviews}) : super(key: key);

  final List<DoctorInfoReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Отзывы',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          ...reviews.map((e) => ReviewCard(review: e)),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
